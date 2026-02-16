import 'app_localizations.dart';

class AppLocalizationsDe implements AppLocalizations {
  // Navigation
  @override String get navHome => 'Startseite';
  @override String get navBooking => 'Buchung';
  @override String get navServices => 'Dienstleistungen';
  @override String get navAbout => 'Über uns';
  @override String get navContact => 'Kontakt';
  @override String get navFaq => 'FAQ';

  // Banner
  @override String get bannerHeading => 'Ihr zuverlässiges Taxi in Malmedy';
  @override String get bannerText => '24/7 verfügbar für alle Ihre Fahrten.';
  @override String get bookNow => 'Jetzt buchen';

  // Cards
  @override String get cardQualityTitle => 'Qualitätsservice';
  @override String get cardQualityText => 'Unsere professionellen Fahrer bringen Sie sicher ans Ziel.';
  @override String get cardEasyBookingTitle => 'Einfache Buchung';
  @override String get cardEasyBookingText => 'Buchen Sie Ihre Fahrt mit wenigen Klicks.';
  @override String get cardPricingTitle => 'Transparente Preise';
  @override String get cardPricingText => 'Keine Überraschungen, unsere Preise sind klar angegeben.';

  // Booking/Reservation
  @override String get reservationTitle => 'Buchung';
  @override String get reservationDescription => 'Buchen Sie Ihre Fahrt einfach mit unserem Online-Service.';
  @override String get pickupLabel => 'Abholadresse';
  @override String get destinationLabel => 'Ziel';
  @override String get useLocation => 'Meinen Standort verwenden';
  @override String get selectOnMap => 'Auf Karte auswählen';
  @override String get rideType => 'Fahrttyp';
  @override String get rideNow => 'Jetzt buchen';
  @override String get rideScheduled => 'Für später planen';
  @override String get pickupDateTime => 'Abholdatum und -zeit';
  @override String get recurringRide => 'Wiederkehrende Fahrt';
  @override String get fareEstimate => 'Preisschätzung';
  @override String get luggageCount => 'Große Gepäckstücke';
  @override String get petCount => 'Haustiere';
  @override String get airportRide => 'Flughafentransfer';
  @override String get calculateFare => 'Preis berechnen';
  @override String get paymentMethod => 'Zahlungsmethode';
  @override String get submitBooking => 'Buchen';

  // Contact
  @override String get contactTitle => 'Kontakt';
  @override String get firstName => 'Vorname';
  @override String get lastName => 'Nachname';
  @override String get email => 'E-Mail';
  @override String get subject => 'Betreff';
  @override String get message => 'Nachricht';
  @override String get send => 'Senden';
  @override String get contactAddress => 'Rue de la gare 5 bte 18, 4960 Malmedy, Belgien';
  @override String get contactPhone => '+32 494 39 32 70';
  @override String get contactEmail => 'marcatofranco@live.fr';
  @override String get officeHours => 'Montag bis Samstag: 9-18 Uhr';

  // Login
  @override String get loginTitle => 'MyCabsy';
  @override String get driverPortal => 'Fahrer-Portal';
  @override String get passengerPortal => 'Fahrgast-Portal';
  @override String get password => 'Passwort';
  @override String get rememberMe => 'Angemeldet bleiben';
  @override String get forgotPassword => 'Passwort vergessen?';
  @override String get noAccount => 'Noch kein Konto?';
  @override String get createAccount => 'Konto erstellen';

  // Signup
  @override String get signupTitle => 'Fahrgastkonto erstellen';
  @override String get confirmPassword => 'Passwort bestätigen';
  @override String get signUp => 'Registrieren';
  @override String get hasAccount => 'Bereits ein Konto?';
  @override String get loginLink => 'Anmelden';
  @override String get passwordHint => 'Mindestens 10 Zeichen mit Großbuchstabe, Ziffer und Sonderzeichen';
  @override String get termsAgree => 'Mit der Kontoerstellung akzeptieren Sie unsere AGB';

  // Dashboard Passenger
  @override String get dashboardPassengerTitle => 'Fahrgast-Dashboard';
  @override String get welcome => 'Willkommen in Ihrem MyCabsy-Bereich';
  @override String get myBookings => 'Meine Buchungen';
  @override String get newBooking => 'Neue Buchung';
  @override String get profile => 'Mein Profil';
  @override String get history => 'Fahrthistorie';
  @override String get logout => 'Abmelden';
  @override String get noBookings => 'Keine aktiven Buchungen';
  @override String get savedLocations => 'Gespeicherte Adressen';
  @override String get addLocation => 'Adresse hinzufügen';
  @override String get paymentMethods => 'Zahlungsmethoden';
  @override String get addPaymentMethod => 'Zahlungsmethode hinzufügen';

  // Dashboard Driver
  @override String get dashboardDriverTitle => 'Fahrer-Dashboard';
  @override String get welcomeDriver => 'Willkommen Fahrer';
  @override String get activeRides => 'Aktive Fahrten';
  @override String get todayStats => 'Tagesstatistik';
  @override String get earnings => 'Einnahmen';
  @override String get completedRides => 'Abgeschlossene Fahrten';
  @override String get availability => 'Verfügbarkeit';
  @override String get available => 'Verfügbar';
  @override String get offline => 'Offline';
  @override String get toggleStatus => 'Status wechseln';
  @override String get noActiveRides => 'Keine aktiven Fahrten';

  // 2FA
  @override String get twoFactorTitle => 'Zwei-Faktor-Authentifizierung';
  @override String get twoFactorDescription => 'Die Zwei-Faktor-Authentifizierung fügt Ihrem Konto eine zusätzliche Sicherheitsebene hinzu.';
  @override String get enable2FA => '2FA aktivieren';
  @override String get disable2FA => '2FA deaktivieren';
  @override String get status2FA => 'Status';
  @override String get enabled => 'Aktiviert';
  @override String get disabled => 'Deaktiviert';

  // Payment
  @override String get cash => 'Bargeld';
  @override String get card => 'Karte';
  @override String get online => 'Online';
  @override String get savedMethod => 'Gespeicherte Methode';

  // FAQ
  @override String get faqTitle => 'Häufig gestellte Fragen';
  @override String get faqIntro => 'Finden Sie schnelle Antworten auf die häufigsten Fragen zu unseren Taxi-Services.';

  // Terms, Privacy, Legal
  @override String get termsTitle => 'Allgemeine Geschäftsbedingungen';
  @override String get privacyTitle => 'Datenschutzerklärung';
  @override String get legalTitle => 'Impressum';

  // About
  @override String get aboutTitle => 'Über Cabsy';
  @override String get aboutText => 'Cabsy bietet professionellen, sicheren und pünktlichen Taxiservice in Malmedy, Belgien.';

  // Misc
  @override String get cancel => 'Abbrechen';
  @override String get confirm => 'Bestätigen';
  @override String get save => 'Speichern';
  @override String get delete => 'Löschen';
  @override String get edit => 'Bearbeiten';
  @override String get back => 'Zurück';
  @override String get next => 'Weiter';
  @override String get loading => 'Laden...';
  @override String get error => 'Ein Fehler ist aufgetreten';
  @override String get success => 'Erfolg';
  @override String get retry => 'Wiederholen';
}
