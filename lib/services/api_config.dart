/// Central API configuration for the Cabsy backend.
class ApiConfig {
  ApiConfig._();

  static const String baseUrl = 'https://cabsy.be';

  // Payment endpoints
  static const String createPayment = '/api/payment/mollie/create-payment';
  static const String paymentStatus = '/api/payment/mollie/status';

  // Booking endpoints
  static const String createBooking = '/api/bookings';
}
