import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/payment_service.dart';

class BookingScreen extends StatefulWidget {
  final bool presetAirport;
  final bool presetScheduled;
  final bool presetRecurring;

  const BookingScreen({
    super.key,
    this.presetAirport = false,
    this.presetScheduled = false,
    this.presetRecurring = false,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _pickupController = TextEditingController();
  final _destinationController = TextEditingController();

  String _rideType = 'now';
  DateTime? _scheduledDateTime;
  bool _isRecurring = false;
  String _recurrencePattern = 'daily';
  int _luggageCount = 0;
  int _petCount = 0;
  bool _isAirportRide = false;
  String _paymentMethod = 'cash';

  double? _estimatedFare;
  bool _isSubmitting = false;
  final PaymentService _paymentService = PaymentService();

  @override
  void initState() {
    super.initState();
    if (widget.presetAirport) _isAirportRide = true;
    if (widget.presetScheduled) _rideType = 'scheduled';
    if (widget.presetRecurring) _isRecurring = true;
  }

  @override
  void dispose() {
    _pickupController.dispose();
    _destinationController.dispose();
    _paymentService.dispose();
    super.dispose();
  }

  void _calculateFare() {
    // Belgian taxi pricing matching the website (cabsy.be)
    const double baseFare = 8.0;
    const double pricePerKm = 3.0;
    const double pricePerMin = 1.0;
    const double minimumFare = 8.0;
    const double maximumFare = 300.0;
    const double luggageFeePerItem = 2.0;
    const double petFeeAmount = 5.0;
    const double airportSurchargeAmount = 10.0;

    double estimatedDistance = 10.0; // placeholder until GPS/maps integrated
    double estimatedMinutes = 15.0; // placeholder

    double fare =
        baseFare +
        (pricePerKm * estimatedDistance) +
        (pricePerMin * estimatedMinutes);

    // Time surcharges
    if (_scheduledDateTime != null) {
      final hour = _scheduledDateTime!.hour;
      final weekday = _scheduledDateTime!.weekday;

      // Night surcharge (22h-6h): +10%
      if (hour >= 22 || hour < 6) {
        fare *= 1.10;
      }
      // Sunday surcharge: +15%
      if (weekday == DateTime.sunday) {
        fare *= 1.15;
      }
    }

    // Extra fees
    fare += _luggageCount * luggageFeePerItem;
    fare += _petCount * petFeeAmount;
    if (_isAirportRide) fare += airportSurchargeAmount;

    // Enforce minimum fare
    if (fare < minimumFare) fare = minimumFare;

    // Enforce maximum fare cap
    if (fare > maximumFare) fare = maximumFare;

    setState(() {
      _estimatedFare = fare;
    });
  }

  Future<void> _selectDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(hours: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );

    if (date != null && mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null && mounted) {
        setState(() {
          _scheduledDateTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  void _submitBooking() {
    if (_formKey.currentState!.validate()) {
      if (_paymentMethod == 'online') {
        _startMolliePayment();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).success),
            backgroundColor: AppTheme.successText,
          ),
        );
      }
    }
  }

  Future<void> _startMolliePayment() async {
    if (_isSubmitting) return;
    setState(() => _isSubmitting = true);

    final l10n = AppLocalizations.of(context);

    try {
      // TODO: Replace with real booking reference and quote token
      // once the full booking API is integrated
      final result = await _paymentService.createPayment(
        bookingReference: 'CB-${DateTime.now().millisecondsSinceEpoch}',
        quoteToken: 'demo',
      );

      if (!mounted) return;

      if (result.success && result.checkoutUrl != null) {
        final url = Uri.parse(result.checkoutUrl!);
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } else {
          _showPaymentError(l10n.paymentError);
        }
      } else {
        _showPaymentError(result.error ?? l10n.paymentError);
      }
    } catch (_) {
      if (mounted) _showPaymentError(l10n.paymentError);
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  void _showPaymentError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.reservationTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.reservationDescription,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),

              // Pickup Location
              TextFormField(
                controller: _pickupController,
                decoration: InputDecoration(
                  labelText: l10n.pickupLabel,
                  prefixIcon: const Icon(
                    Icons.trip_origin,
                    color: Colors.green,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.my_location),
                    onPressed: () {
                      // TODO: Get current location
                      _pickupController.text = 'Current Location';
                    },
                    tooltip: l10n.useLocation,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter pickup location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Destination
              TextFormField(
                controller: _destinationController,
                decoration: InputDecoration(
                  labelText: l10n.destinationLabel,
                  prefixIcon: const Icon(Icons.location_on, color: Colors.red),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter destination';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Map Placeholder
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: AppTheme.gray100,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.gray200),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map, size: 48, color: AppTheme.grayMedium),
                      const SizedBox(height: 8),
                      Text(
                        l10n.selectOnMap,
                        style: TextStyle(color: AppTheme.grayMedium),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Ride Type
              Text(
                l10n.rideType,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              SegmentedButton<String>(
                segments: [
                  ButtonSegment(
                    value: 'now',
                    label: Text(l10n.rideNow),
                    icon: const Icon(Icons.bolt),
                  ),
                  ButtonSegment(
                    value: 'scheduled',
                    label: Text(l10n.rideScheduled),
                    icon: const Icon(Icons.schedule),
                  ),
                ],
                selected: {_rideType},
                onSelectionChanged: (selection) {
                  setState(() {
                    _rideType = selection.first;
                  });
                },
              ),

              // Scheduled options
              if (_rideType == 'scheduled') ...[
                const SizedBox(height: 16),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.pickupDateTime),
                  subtitle: Text(
                    _scheduledDateTime != null
                        ? '${_scheduledDateTime!.day}/${_scheduledDateTime!.month}/${_scheduledDateTime!.year} ${_scheduledDateTime!.hour}:${_scheduledDateTime!.minute.toString().padLeft(2, '0')}'
                        : 'Not selected',
                  ),
                  trailing: ElevatedButton(
                    onPressed: _selectDateTime,
                    child: const Text('Select'),
                  ),
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.recurringRide),
                  value: _isRecurring,
                  onChanged: (value) {
                    setState(() {
                      _isRecurring = value;
                    });
                  },
                ),
                if (_isRecurring)
                  DropdownButtonFormField<String>(
                    value: _recurrencePattern,
                    decoration: const InputDecoration(labelText: 'Repeat'),
                    items: const [
                      DropdownMenuItem(value: 'daily', child: Text('Daily')),
                      DropdownMenuItem(
                        value: 'weekdays',
                        child: Text('Weekdays'),
                      ),
                      DropdownMenuItem(value: 'weekly', child: Text('Weekly')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _recurrencePattern = value!;
                      });
                    },
                  ),
              ],
              const SizedBox(height: 24),

              // Fare Estimation Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.fareEstimate,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _CounterField(
                              label: l10n.luggageCount,
                              value: _luggageCount,
                              onChanged:
                                  (v) => setState(() => _luggageCount = v),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _CounterField(
                              label: l10n.petCount,
                              value: _petCount,
                              onChanged: (v) => setState(() => _petCount = v),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(l10n.airportRide),
                        value: _isAirportRide,
                        onChanged: (v) => setState(() => _isAirportRide = v!),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: _calculateFare,
                          icon: const Icon(Icons.calculate),
                          label: Text(l10n.calculateFare),
                        ),
                      ),
                      if (_estimatedFare != null) ...[
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryYellow.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Estimated Fare',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '€${_estimatedFare!.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Payment Method
              Text(
                l10n.paymentMethod,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  ChoiceChip(
                    label: Text(l10n.cash),
                    selected: _paymentMethod == 'cash',
                    onSelected: (s) => setState(() => _paymentMethod = 'cash'),
                  ),
                  ChoiceChip(
                    label: Text(l10n.card),
                    selected: _paymentMethod == 'card',
                    onSelected: (s) => setState(() => _paymentMethod = 'card'),
                  ),
                  ChoiceChip(
                    label: Text(l10n.online),
                    selected: _paymentMethod == 'online',
                    onSelected:
                        (s) => setState(() => _paymentMethod = 'online'),
                  ),
                ],
              ),
              if (_paymentMethod == 'online') ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.lock, size: 16, color: Colors.green),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        l10n.mollieSecureNote,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 32),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitBooking,
                  child:
                      _isSubmitting
                          ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                          : Text(
                            _paymentMethod == 'online'
                                ? l10n.payWithMollie
                                : l10n.submitBooking,
                            style: const TextStyle(fontSize: 18),
                          ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _CounterField extends StatelessWidget {
  final String label;
  final int value;
  final ValueChanged<int> onChanged;

  const _CounterField({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12)),
        const SizedBox(height: 8),
        Row(
          children: [
            IconButton.outlined(
              icon: const Icon(Icons.remove),
              onPressed: value > 0 ? () => onChanged(value - 1) : null,
              iconSize: 20,
            ),
            Expanded(
              child: Text(
                '$value',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton.outlined(
              icon: const Icon(Icons.add),
              onPressed: () => onChanged(value + 1),
              iconSize: 20,
            ),
          ],
        ),
      ],
    );
  }
}
