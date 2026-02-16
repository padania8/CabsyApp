import 'app_localizations.dart';

class AppLocalizationsEn implements AppLocalizations {
  // Navigation
  @override String get navHome => 'Home';
  @override String get navBooking => 'Booking';
  @override String get navServices => 'Services';
  @override String get navAbout => 'About';
  @override String get navContact => 'Contact';
  @override String get navFaq => 'FAQ';

  // Banner
  @override String get bannerHeading => 'Your trusted taxi in Malmedy';
  @override String get bannerText => 'Available 24/7 for all your journeys.';
  @override String get bookNow => 'Book now';

  // Cards
  @override String get cardQualityTitle => 'Quality Service';
  @override String get cardQualityText => 'Our professional drivers take you safely.';
  @override String get cardEasyBookingTitle => 'Easy booking';
  @override String get cardEasyBookingText => 'Book your trip in a few clicks with our online form.';
  @override String get cardPricingTitle => 'Transparent pricing';
  @override String get cardPricingText => 'No surprises, our rates are clearly displayed during booking.';

  // Booking/Reservation
  @override String get reservationTitle => 'Booking';
  @override String get reservationDescription => 'Book your ride easily using our online service.';
  @override String get pickupLabel => 'Pickup address';
  @override String get destinationLabel => 'Destination';
  @override String get useLocation => 'Use my location';
  @override String get selectOnMap => 'Select on map';
  @override String get rideType => 'Ride Type';
  @override String get rideNow => 'Book now';
  @override String get rideScheduled => 'Schedule for later';
  @override String get pickupDateTime => 'Pickup Date & Time';
  @override String get recurringRide => 'Recurring ride';
  @override String get fareEstimate => 'Fare Estimate';
  @override String get luggageCount => 'Large luggage items';
  @override String get petCount => 'Pets';
  @override String get airportRide => 'Airport pickup/dropoff';
  @override String get calculateFare => 'Calculate Fare';
  @override String get paymentMethod => 'Payment Method';
  @override String get submitBooking => 'Book now';

  // Contact
  @override String get contactTitle => 'Contact';
  @override String get firstName => 'First name';
  @override String get lastName => 'Last name';
  @override String get email => 'Email';
  @override String get subject => 'Subject';
  @override String get message => 'Message';
  @override String get send => 'Send';
  @override String get contactAddress => 'Rue de la gare 5 bte 18, 4960 Malmedy, Belgium';
  @override String get contactPhone => '+32 494 39 32 70';
  @override String get contactEmail => 'marcatofranco@live.fr';
  @override String get officeHours => 'Monday to Saturday: 9am-6pm';

  // Login
  @override String get loginTitle => 'MyCabsy';
  @override String get driverPortal => 'Driver portal';
  @override String get passengerPortal => 'Passenger portal';
  @override String get password => 'Password';
  @override String get rememberMe => 'Remember me';
  @override String get forgotPassword => 'Forgot password?';
  @override String get noAccount => 'Don\'t have an account?';
  @override String get createAccount => 'Create account';

  // Signup
  @override String get signupTitle => 'Create passenger account';
  @override String get confirmPassword => 'Confirm password';
  @override String get signUp => 'Sign up';
  @override String get hasAccount => 'Already have an account?';
  @override String get loginLink => 'Log in';
  @override String get passwordHint => '10 characters minimum, with uppercase, digit and special character';
  @override String get termsAgree => 'By creating an account, you agree to our terms and conditions';

  // Dashboard Passenger
  @override String get dashboardPassengerTitle => 'Passenger Dashboard';
  @override String get welcome => 'Welcome to your MyCabsy space';
  @override String get myBookings => 'My bookings';
  @override String get newBooking => 'New booking';
  @override String get profile => 'My profile';
  @override String get history => 'Ride history';
  @override String get logout => 'Logout';
  @override String get noBookings => 'No active bookings';
  @override String get savedLocations => 'Saved Locations';
  @override String get addLocation => 'Add Location';
  @override String get paymentMethods => 'Payment Methods';
  @override String get addPaymentMethod => 'Add Payment Method';

  // Dashboard Driver
  @override String get dashboardDriverTitle => 'Driver Dashboard';
  @override String get welcomeDriver => 'Welcome driver';
  @override String get activeRides => 'Active rides';
  @override String get todayStats => 'Today\'s stats';
  @override String get earnings => 'Earnings';
  @override String get completedRides => 'Completed rides';
  @override String get availability => 'Availability';
  @override String get available => 'Available';
  @override String get offline => 'Offline';
  @override String get toggleStatus => 'Toggle status';
  @override String get noActiveRides => 'No active rides';

  // 2FA
  @override String get twoFactorTitle => 'Two-Factor Authentication';
  @override String get twoFactorDescription => 'Two-factor authentication adds an extra layer of security to your account.';
  @override String get enable2FA => 'Enable 2FA';
  @override String get disable2FA => 'Disable 2FA';
  @override String get status2FA => 'Status';
  @override String get enabled => 'Enabled';
  @override String get disabled => 'Disabled';

  // Payment
  @override String get cash => 'Cash';
  @override String get card => 'Card';
  @override String get online => 'Online';
  @override String get savedMethod => 'Saved method';

  // FAQ
  @override String get faqTitle => 'Frequently Asked Questions';
  @override String get faqIntro => 'Find quick answers to the most common questions about our taxi services.';

  // Terms, Privacy, Legal
  @override String get termsTitle => 'Terms and Conditions';
  @override String get privacyTitle => 'Privacy Policy';
  @override String get legalTitle => 'Legal Notice';

  // About
  @override String get aboutTitle => 'About Cabsy';
  @override String get aboutText => 'Cabsy provides professional, safe and punctual taxi service in Malmedy, Belgium.';

  // Misc
  @override String get cancel => 'Cancel';
  @override String get confirm => 'Confirm';
  @override String get save => 'Save';
  @override String get delete => 'Delete';
  @override String get edit => 'Edit';
  @override String get back => 'Back';
  @override String get next => 'Next';
  @override String get loading => 'Loading...';
  @override String get error => 'An error occurred';
  @override String get success => 'Success';
  @override String get retry => 'Retry';
}
