import 'package:flutter/material.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_de.dart';
import 'app_localizations_nl.dart';

abstract class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('fr'),
    Locale('de'),
    Locale('nl'),
  ];

  // Navigation
  String get navHome;
  String get navBooking;
  String get navServices;
  String get navAbout;
  String get navContact;
  String get navFaq;

  // Banner
  String get bannerHeading;
  String get bannerText;
  String get bookNow;

  // Cards
  String get cardQualityTitle;
  String get cardQualityText;
  String get cardEasyBookingTitle;
  String get cardEasyBookingText;
  String get cardPricingTitle;
  String get cardPricingText;

  // Booking/Reservation
  String get reservationTitle;
  String get reservationDescription;
  String get pickupLabel;
  String get destinationLabel;
  String get useLocation;
  String get selectOnMap;
  String get rideType;
  String get rideNow;
  String get rideScheduled;
  String get pickupDateTime;
  String get recurringRide;
  String get fareEstimate;
  String get luggageCount;
  String get petCount;
  String get airportRide;
  String get calculateFare;
  String get paymentMethod;
  String get submitBooking;

  // Contact
  String get contactTitle;
  String get firstName;
  String get lastName;
  String get email;
  String get subject;
  String get message;
  String get send;
  String get contactAddress;
  String get contactPhone;
  String get contactEmail;
  String get officeHours;

  // Login
  String get loginTitle;
  String get driverPortal;
  String get passengerPortal;
  String get password;
  String get rememberMe;
  String get forgotPassword;
  String get noAccount;
  String get createAccount;

  // Signup
  String get signupTitle;
  String get confirmPassword;
  String get signUp;
  String get hasAccount;
  String get loginLink;
  String get passwordHint;
  String get termsAgree;

  // Dashboard Passenger
  String get dashboardPassengerTitle;
  String get welcome;
  String get myBookings;
  String get newBooking;
  String get profile;
  String get history;
  String get logout;
  String get noBookings;
  String get savedLocations;
  String get addLocation;
  String get paymentMethods;
  String get addPaymentMethod;

  // Dashboard Driver
  String get dashboardDriverTitle;
  String get welcomeDriver;
  String get activeRides;
  String get todayStats;
  String get earnings;
  String get completedRides;
  String get availability;
  String get available;
  String get offline;
  String get toggleStatus;
  String get noActiveRides;

  // 2FA
  String get twoFactorTitle;
  String get twoFactorDescription;
  String get enable2FA;
  String get disable2FA;
  String get status2FA;
  String get enabled;
  String get disabled;

  // Payment
  String get cash;
  String get card;
  String get online;
  String get savedMethod;

  // FAQ
  String get faqTitle;
  String get faqIntro;

  // Terms, Privacy, Legal
  String get termsTitle;
  String get privacyTitle;
  String get legalTitle;

  // About
  String get aboutTitle;
  String get aboutText;

  // Misc
  String get cancel;
  String get confirm;
  String get save;
  String get delete;
  String get edit;
  String get back;
  String get next;
  String get loading;
  String get error;
  String get success;
  String get retry;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fr', 'de', 'nl'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'fr':
        return AppLocalizationsFr();
      case 'de':
        return AppLocalizationsDe();
      case 'nl':
        return AppLocalizationsNl();
      case 'en':
      default:
        return AppLocalizationsEn();
    }
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
