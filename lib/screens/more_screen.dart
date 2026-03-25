import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../main.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('More')),
      body: ListView(
        children: [
          const SizedBox(height: 8),

          // Language Section
          _SectionHeader(title: 'Settings'),
          _MenuTile(
            icon: Icons.language,
            title: 'Language',
            subtitle: _getCurrentLanguageName(context),
            onTap: () => _showLanguageSelector(context),
          ),
          _MenuTile(
            icon: Icons.dark_mode,
            title: 'Dark Mode',
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                CabsyApp.of(
                  context,
                )?.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
              },
            ),
          ),

          const Divider(),

          // Information Section
          _SectionHeader(title: 'Information'),
          _MenuTile(
            icon: Icons.local_taxi,
            title: l10n.servicesTitle,
            onTap: () => _showServices(context, l10n),
          ),
          _MenuTile(
            icon: Icons.euro,
            title: l10n.tariffsTitle,
            onTap: () => _showTariffs(context, l10n),
          ),
          _MenuTile(
            icon: Icons.info_outline,
            title: l10n.aboutTitle,
            onTap: () => _showAbout(context, l10n),
          ),
          _MenuTile(
            icon: Icons.help_outline,
            title: l10n.faqTitle,
            onTap: () => _showFaq(context, l10n),
          ),
          _MenuTile(
            icon: Icons.phone,
            title: l10n.contactTitle,
            onTap: () => _showContact(context, l10n),
          ),

          const Divider(),

          // Legal Section
          _SectionHeader(title: 'Legal'),
          _MenuTile(
            icon: Icons.description_outlined,
            title: l10n.termsTitle,
            onTap: () => _showTerms(context, l10n),
          ),
          _MenuTile(
            icon: Icons.privacy_tip_outlined,
            title: l10n.privacyTitle,
            onTap: () => _showPrivacy(context, l10n),
          ),
          _MenuTile(
            icon: Icons.gavel_outlined,
            title: l10n.legalTitle,
            onTap: () => _showLegal(context, l10n),
          ),

          const SizedBox(height: 24),

          // Version Info
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryYellow,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.local_taxi,
                          color: AppTheme.primaryBlack,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Cabsy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Version 1.0.0',
                    style: TextStyle(color: AppTheme.grayMedium, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '© 2026 Cabsy. All rights reserved.',
                    style: TextStyle(color: AppTheme.grayMedium, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getCurrentLanguageName(BuildContext context) {
    final locale = Localizations.localeOf(context);
    switch (locale.languageCode) {
      case 'fr':
        return 'Français';
      case 'de':
        return 'Deutsch';
      case 'nl':
        return 'Nederlands';
      case 'it':
        return 'Italiano';
      case 'en':
      default:
        return 'English';
    }
  }

  void _showLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (ctx) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Select Language',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _LanguageOption(
                  flag: '🇬🇧',
                  name: 'English',
                  locale: const Locale('en'),
                  onTap: () {
                    CabsyApp.of(context)?.setLocale(const Locale('en'));
                    Navigator.pop(ctx);
                  },
                ),
                _LanguageOption(
                  flag: '🇫🇷',
                  name: 'Français',
                  locale: const Locale('fr'),
                  onTap: () {
                    CabsyApp.of(context)?.setLocale(const Locale('fr'));
                    Navigator.pop(ctx);
                  },
                ),
                _LanguageOption(
                  flag: '🇩🇪',
                  name: 'Deutsch',
                  locale: const Locale('de'),
                  onTap: () {
                    CabsyApp.of(context)?.setLocale(const Locale('de'));
                    Navigator.pop(ctx);
                  },
                ),
                _LanguageOption(
                  flag: '🇳🇱',
                  name: 'Nederlands',
                  locale: const Locale('nl'),
                  onTap: () {
                    CabsyApp.of(context)?.setLocale(const Locale('nl'));
                    Navigator.pop(ctx);
                  },
                ),
                _LanguageOption(
                  flag: '🇮🇹',
                  name: 'Italiano',
                  locale: const Locale('it'),
                  onTap: () {
                    CabsyApp.of(context)?.setLocale(const Locale('it'));
                    Navigator.pop(ctx);
                  },
                ),
              ],
            ),
          ),
    );
  }

  void _showServices(BuildContext context, AppLocalizations l10n) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => Scaffold(
              appBar: AppBar(title: Text(l10n.servicesTitle)),
              body: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(
                    l10n.servicesIntro,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  _ServiceCard(
                    icon: Icons.location_city,
                    title: l10n.serviceLocalTitle,
                    description: l10n.serviceLocalDesc,
                  ),
                  _ServiceCard(
                    icon: Icons.flight,
                    title: l10n.serviceAirportTitle,
                    description: l10n.serviceAirportDesc,
                  ),
                  _ServiceCard(
                    icon: Icons.route,
                    title: l10n.serviceLongDistanceTitle,
                    description: l10n.serviceLongDistanceDesc,
                  ),
                  _ServiceCard(
                    icon: Icons.business_center,
                    title: l10n.serviceBusinessTitle,
                    description: l10n.serviceBusinessDesc,
                  ),
                  _ServiceCard(
                    icon: Icons.accessible,
                    title: l10n.serviceAccessibleTitle,
                    description: l10n.serviceAccessibleDesc,
                  ),
                  _ServiceCard(
                    icon: Icons.schedule,
                    title: l10n.serviceScheduledTitle,
                    description: l10n.serviceScheduledDesc,
                  ),
                ],
              ),
            ),
      ),
    );
  }

  void _showTariffs(BuildContext context, AppLocalizations l10n) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => Scaffold(
              appBar: AppBar(title: Text(l10n.tariffsTitle)),
              body: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(
                    l10n.tariffsIntro,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),

                  // Base Pricing Table
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.tariffsTitle,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          _TariffRow(label: l10n.baseFare, value: '€8.00'),
                          _TariffRow(label: l10n.perKm, value: '€3.00'),
                          _TariffRow(label: l10n.perMinute, value: '€1.00'),
                          _TariffRow(label: l10n.minimumFare, value: '€8.00'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Time Surcharges
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.surcharges,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          _TariffRow(label: l10n.nightSurcharge, value: '+10%'),
                          _TariffRow(
                            label: l10n.sundaySurcharge,
                            value: '+15%',
                          ),
                          _TariffRow(
                            label: l10n.holidaySurcharge,
                            value: '+30%',
                          ),
                          _TariffRow(
                            label: l10n.shortNoticeSurcharge,
                            value: '+10%',
                          ),
                          _TariffRow(
                            label: l10n.earlyBookingDiscount,
                            value: '-10%',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Extra Fees
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.extraFees,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          _TariffRow(label: l10n.luggageFee, value: '€2.00'),
                          _TariffRow(label: l10n.petFee, value: '€5.00'),
                          _TariffRow(label: l10n.airportFee, value: '€10.00'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Regulation info
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryYellow.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          color: AppTheme.primaryBlack,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            l10n.regulationInfo,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
      ),
    );
  }

  void _showAbout(BuildContext context, AppLocalizations l10n) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => Scaffold(
              appBar: AppBar(title: Text(l10n.aboutTitle)),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryYellow.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.local_taxi,
                          size: 64,
                          color: AppTheme.primaryBlack,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Text(
                        'Cabsy',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      l10n.aboutText,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),

                    // Stats section matching website
                    Row(
                      children: [
                        Expanded(
                          child: _StatCard(
                            value: '24/7',
                            label: 'Availability',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _StatCard(value: '10+', label: 'Years'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: _StatCard(value: '5000+', label: 'Rides'),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _StatCard(value: '98%', label: 'Satisfaction'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    _InfoRow(
                      icon: Icons.location_on,
                      text: l10n.contactAddress,
                    ),
                    _InfoRow(icon: Icons.phone, text: l10n.contactPhone),
                    _InfoRow(icon: Icons.email, text: l10n.contactEmail),
                    _InfoRow(icon: Icons.schedule, text: l10n.officeHours),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  void _showFaq(BuildContext context, AppLocalizations l10n) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => Scaffold(
              appBar: AppBar(title: Text(l10n.faqTitle)),
              body: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(
                    l10n.faqIntro,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  const _FaqItem(
                    question: 'How can I book a taxi?',
                    answer:
                        'You can book your taxi in several ways: by phone, via our website, or directly from this mobile app. We recommend booking in advance for airport trips.',
                  ),
                  const _FaqItem(
                    question: 'What payment methods are accepted?',
                    answer:
                        'We accept bank cards (Visa, Mastercard), online payment via Mollie, and cash payments on board.',
                  ),
                  const _FaqItem(
                    question: 'What is Cabsy\'s coverage area?',
                    answer:
                        'Cabsy mainly serves Malmedy and the surrounding municipalities. We also provide long-distance trips to airports and major cities in Belgium, Luxembourg, Germany and the Netherlands.',
                  ),
                  const _FaqItem(
                    question: 'Can I cancel my booking?',
                    answer:
                        'Yes, you can cancel free of charge up to 24 hours before pick-up. After this period, the full amount is due.',
                  ),
                  const _FaqItem(
                    question: 'Can I travel with my pet?',
                    answer:
                        'Yes, pets are accepted. Small animals should be in a carrier. For large dogs, please inform us when booking. A pet transport supplement applies.',
                  ),
                  const _FaqItem(
                    question: 'What are the rates?',
                    answer:
                        'Our prices follow the legal Belgian taxi rates: €8.00 base fare, €3.00/km, €1.00/min. Surcharges may apply for night, Sunday, holiday or airport trips. Check our Tariffs page for full details.',
                  ),
                  const _FaqItem(
                    question: 'Do you offer airport transfers?',
                    answer:
                        'Yes, we provide shuttle services to and from all major Belgian airports: Brussels (Zaventem), Brussels South (Charleroi), and Liège.',
                  ),
                  const _FaqItem(
                    question: 'Can I schedule a ride in advance?',
                    answer:
                        'Absolutely! You can schedule a ride for a specific date and time. You can also set up recurring rides for regular trips like work commutes or medical appointments.',
                  ),
                  const _FaqItem(
                    question: 'Is there a minimum fare?',
                    answer:
                        'Yes, the minimum fare is €8.00. This covers short trips within the immediate Malmedy area.',
                  ),
                  const _FaqItem(
                    question: 'Do you offer business/corporate services?',
                    answer:
                        'Yes! We offer corporate invoicing, multi-user accounts, and regular scheduling for businesses. Contact us for a tailored offer.',
                  ),
                  const _FaqItem(
                    question: 'Is accessibility transport available?',
                    answer:
                        'Yes, we have an adapted vehicle available for persons with reduced mobility. Please mention this when booking so we can arrange the appropriate transport.',
                  ),
                ],
              ),
            ),
      ),
    );
  }

  void _showContact(BuildContext context, AppLocalizations l10n) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => _ContactPage(l10n: l10n)));
  }

  void _showTerms(BuildContext context, AppLocalizations l10n) {
    _showLegalPage(context, l10n.termsTitle, '''
1. Purpose
These Terms and Conditions define the conditions under which Cabsy provides its taxi transportation services.

2. Bookings
Bookings can be made by phone, online via our website or mobile application. All bookings are confirmed by email or SMS.

3. Pricing
Prices are calculated according to the legal fare meter in force in Belgium. Surcharges may apply for bulky luggage, animals, or night trips.

4. Payment
Payment is made in advance when booking via our secure platform. We accept bank cards and PayPal.

5. Cancellation
Any cancellation must be made at least 24 hours before the scheduled pick-up time to receive a full refund.

6. Liability
Cabsy undertakes to provide a quality service in compliance with current regulations. Our liability is covered by professional insurance.
    ''');
  }

  void _showPrivacy(BuildContext context, AppLocalizations l10n) {
    _showLegalPage(context, l10n.privacyTitle, '''
Controller: Cabsy, Malmedy, Belgium.

We process your personal data to respond to contact requests, manage your account, and provide taxi services.

Data collected: identity and contact details, message content, booking history, payment information, geolocation data, and technical data.

Retention: inquiry emails kept up to 12 months; booking and payment records kept for the legally required period.

Rights: you can request access, rectification, erasure, restriction, and portability of your data.

Contact: privacy@cabsy.com
    ''');
  }

  void _showLegal(BuildContext context, AppLocalizations l10n) {
    _showLegalPage(context, l10n.legalTitle, '''
Website Publisher
The website cabsy.com is published by Cabsy, a passenger transport taxi company, registered in Malmedy, Belgium.

Publication Director
The publication director is the legal representative of Cabsy.

Intellectual Property
All content on this site is the exclusive property of Cabsy or its partners. Any reproduction is prohibited without prior written authorization.

Applicable Law
These legal notices are governed by Belgian law.
    ''');
  }

  void _showLegalPage(BuildContext context, String title, String content) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => Scaffold(
              appBar: AppBar(title: Text(title)),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Text(
                  content,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppTheme.grayMedium,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _MenuTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primaryBlack),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String flag;
  final String name;
  final Locale locale;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.flag,
    required this.name,
    required this.locale,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = Localizations.localeOf(context) == locale;

    return ListTile(
      leading: Text(flag, style: const TextStyle(fontSize: 24)),
      title: Text(name),
      trailing:
          isSelected
              ? const Icon(Icons.check, color: AppTheme.primaryYellow)
              : null,
      selected: isSelected,
      onTap: onTap,
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool large;

  const _InfoRow({required this.icon, required this.text, this.large = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: large ? 8 : 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: large ? 24 : 20, color: AppTheme.primaryYellow),
          SizedBox(width: large ? 16 : 12),
          Expanded(
            child: Text(text, style: TextStyle(fontSize: large ? 16 : 14)),
          ),
        ],
      ),
    );
  }
}

class _FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const _FaqItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(answer),
          ),
        ],
      ),
    );
  }
}

class _ContactPage extends StatefulWidget {
  final AppLocalizations l10n;
  const _ContactPage({required this.l10n});

  @override
  State<_ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<_ContactPage> {
  final _formKey = GlobalKey<FormState>();
  bool _sent = false;

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.contactTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _InfoRow(
              icon: Icons.location_on,
              text: l10n.contactAddress,
              large: true,
            ),
            const SizedBox(height: 16),
            _InfoRow(icon: Icons.phone, text: l10n.contactPhone, large: true),
            const SizedBox(height: 16),
            _InfoRow(icon: Icons.email, text: l10n.contactEmail, large: true),
            const SizedBox(height: 16),
            _InfoRow(icon: Icons.schedule, text: l10n.officeHours, large: true),
            const SizedBox(height: 32),

            if (_sent) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.successBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: AppTheme.successText),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        l10n.contactFormSent,
                        style: const TextStyle(color: AppTheme.successText),
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              Text(
                'Send us a message',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: l10n.firstName),
                      validator:
                          (v) => v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: InputDecoration(labelText: l10n.lastName),
                      validator:
                          (v) => v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: InputDecoration(labelText: l10n.email),
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Required';
                        if (!v.contains('@')) return 'Invalid email';
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: InputDecoration(labelText: l10n.phone),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: InputDecoration(labelText: l10n.subject),
                      validator:
                          (v) => v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: InputDecoration(labelText: l10n.message),
                      maxLines: 4,
                      validator:
                          (v) => v == null || v.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // TODO: Send to backend API when available
                            setState(() => _sent = true);
                          }
                        },
                        child: Text(l10n.send),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.primaryYellow.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppTheme.primaryBlack, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(color: AppTheme.grayMedium, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TariffRow extends StatelessWidget {
  final String label;
  final String value;

  const _TariffRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label)),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryBlack,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(color: AppTheme.grayMedium, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
