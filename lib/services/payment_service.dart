import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';

/// Result of a Mollie payment creation.
class PaymentResult {
  final bool success;
  final String? checkoutUrl;
  final String? paymentId;
  final String? error;

  const PaymentResult({
    required this.success,
    this.checkoutUrl,
    this.paymentId,
    this.error,
  });
}

/// Result of a Mollie payment status check.
class PaymentStatus {
  final String status; // open, pending, paid, failed, expired, cancelled
  final String? bookingReference;
  final double? amount;

  const PaymentStatus({
    required this.status,
    this.bookingReference,
    this.amount,
  });

  bool get isPaid => status == 'paid';
  bool get isPending => ['open', 'pending', 'authorized'].contains(status);
  bool get isFailed => ['failed', 'expired', 'cancelled'].contains(status);
}

/// Service for Mollie payment operations via the CabsyWeb backend.
class PaymentService {
  final http.Client _client;

  PaymentService({http.Client? client}) : _client = client ?? http.Client();

  /// Creates a Mollie payment for a booking.
  /// Returns a [PaymentResult] with the checkout URL to redirect the user.
  Future<PaymentResult> createPayment({
    required String bookingReference,
    required String quoteToken,
    String? pagePath,
  }) async {
    try {
      final uri = Uri.parse('${ApiConfig.baseUrl}${ApiConfig.createPayment}');
      final response = await _client.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'bookingReference': bookingReference,
          'quoteToken': quoteToken,
          if (pagePath != null) 'pagePath': pagePath,
        }),
      );

      final data = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && data['success'] == true) {
        return PaymentResult(
          success: true,
          checkoutUrl: data['checkoutUrl'] as String?,
          paymentId: data['paymentId'] as String?,
        );
      }

      return PaymentResult(
        success: false,
        error: data['error'] as String? ?? 'Payment creation failed',
      );
    } catch (e) {
      return PaymentResult(success: false, error: e.toString());
    }
  }

  /// Checks the status of a Mollie payment by quote ID.
  Future<PaymentStatus> getPaymentStatus(String quoteId) async {
    try {
      final uri = Uri.parse(
        '${ApiConfig.baseUrl}${ApiConfig.paymentStatus}/${Uri.encodeComponent(quoteId)}',
      );
      final response = await _client.get(uri);
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && data['success'] == true) {
        final payment = data['payment'] as Map<String, dynamic>;
        return PaymentStatus(
          status: payment['status'] as String? ?? 'unknown',
          bookingReference: payment['bookingReference'] as String?,
          amount: (payment['amount'] as num?)?.toDouble(),
        );
      }

      return const PaymentStatus(status: 'unknown');
    } catch (_) {
      return const PaymentStatus(status: 'unknown');
    }
  }

  void dispose() {
    _client.close();
  }
}
