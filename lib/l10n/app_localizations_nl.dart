import 'app_localizations.dart';

class AppLocalizationsNl implements AppLocalizations {
  // Navigation
  @override String get navHome => 'Home';
  @override String get navBooking => 'Reservering';
  @override String get navServices => 'Diensten';
  @override String get navAbout => 'Over ons';
  @override String get navContact => 'Contact';
  @override String get navFaq => 'FAQ';

  // Banner
  @override String get bannerHeading => 'Uw betrouwbare taxi in Malmedy';
  @override String get bannerText => '24/7 beschikbaar voor al uw ritten.';
  @override String get bookNow => 'Nu boeken';

  // Cards
  @override String get cardQualityTitle => 'Kwaliteitsservice';
  @override String get cardQualityText => 'Onze professionele chauffeurs brengen u veilig op bestemming.';
  @override String get cardEasyBookingTitle => 'Eenvoudig boeken';
  @override String get cardEasyBookingText => 'Boek uw rit met een paar klikken.';
  @override String get cardPricingTitle => 'Transparante prijzen';
  @override String get cardPricingText => 'Geen verrassingen, onze tarieven zijn duidelijk aangegeven.';

  // Booking/Reservation
  @override String get reservationTitle => 'Reservering';
  @override String get reservationDescription => 'Boek uw rit gemakkelijk via onze online service.';
  @override String get pickupLabel => 'Ophaaladres';
  @override String get destinationLabel => 'Bestemming';
  @override String get useLocation => 'Gebruik mijn locatie';
  @override String get selectOnMap => 'Selecteer op kaart';
  @override String get rideType => 'Type rit';
  @override String get rideNow => 'Nu boeken';
  @override String get rideScheduled => 'Plan voor later';
  @override String get pickupDateTime => 'Ophaaldatum en -tijd';
  @override String get recurringRide => 'Terugkerende rit';
  @override String get fareEstimate => 'Geschatte prijs';
  @override String get luggageCount => 'Grote bagage';
  @override String get petCount => 'Huisdieren';
  @override String get airportRide => 'Luchthaventransfer';
  @override String get calculateFare => 'Prijs berekenen';
  @override String get paymentMethod => 'Betaalmethode';
  @override String get submitBooking => 'Boeken';

  // Contact
  @override String get contactTitle => 'Contact';
  @override String get firstName => 'Voornaam';
  @override String get lastName => 'Achternaam';
  @override String get email => 'E-mail';
  @override String get subject => 'Onderwerp';
  @override String get message => 'Bericht';
  @override String get send => 'Verzenden';
  @override String get contactAddress => 'Rue de la gare 5 bte 18, 4960 Malmedy, België';
  @override String get contactPhone => '+32 494 39 32 70';
  @override String get contactEmail => 'marcatofranco@live.fr';
  @override String get officeHours => 'Maandag tot zaterdag: 9-18 uur';

  // Login
  @override String get loginTitle => 'MyCabsy';
  @override String get driverPortal => 'Chauffeur-portaal';
  @override String get passengerPortal => 'Passagier-portaal';
  @override String get password => 'Wachtwoord';
  @override String get rememberMe => 'Onthoud mij';
  @override String get forgotPassword => 'Wachtwoord vergeten?';
  @override String get noAccount => 'Nog geen account?';
  @override String get createAccount => 'Account aanmaken';

  // Signup
  @override String get signupTitle => 'Passagiersaccount aanmaken';
  @override String get confirmPassword => 'Wachtwoord bevestigen';
  @override String get signUp => 'Registreren';
  @override String get hasAccount => 'Al een account?';
  @override String get loginLink => 'Inloggen';
  @override String get passwordHint => 'Minimaal 10 tekens met hoofdletter, cijfer en speciaal teken';
  @override String get termsAgree => 'Door een account aan te maken, gaat u akkoord met onze voorwaarden';

  // Dashboard Passenger
  @override String get dashboardPassengerTitle => 'Passagier Dashboard';
  @override String get welcome => 'Welkom in uw MyCabsy-ruimte';
  @override String get myBookings => 'Mijn reserveringen';
  @override String get newBooking => 'Nieuwe reservering';
  @override String get profile => 'Mijn profiel';
  @override String get history => 'Ritgeschiedenis';
  @override String get logout => 'Uitloggen';
  @override String get noBookings => 'Geen actieve reserveringen';
  @override String get savedLocations => 'Opgeslagen adressen';
  @override String get addLocation => 'Adres toevoegen';
  @override String get paymentMethods => 'Betaalmethoden';
  @override String get addPaymentMethod => 'Betaalmethode toevoegen';

  // Dashboard Driver
  @override String get dashboardDriverTitle => 'Chauffeur Dashboard';
  @override String get welcomeDriver => 'Welkom chauffeur';
  @override String get activeRides => 'Actieve ritten';
  @override String get todayStats => 'Dagstatistieken';
  @override String get earnings => 'Verdiensten';
  @override String get completedRides => 'Voltooide ritten';
  @override String get availability => 'Beschikbaarheid';
  @override String get available => 'Beschikbaar';
  @override String get offline => 'Offline';
  @override String get toggleStatus => 'Status wijzigen';
  @override String get noActiveRides => 'Geen actieve ritten';

  // 2FA
  @override String get twoFactorTitle => 'Tweefactorauthenticatie';
  @override String get twoFactorDescription => 'Tweefactorauthenticatie voegt een extra beveiligingslaag toe aan uw account.';
  @override String get enable2FA => '2FA inschakelen';
  @override String get disable2FA => '2FA uitschakelen';
  @override String get status2FA => 'Status';
  @override String get enabled => 'Ingeschakeld';
  @override String get disabled => 'Uitgeschakeld';

  // Payment
  @override String get cash => 'Contant';
  @override String get card => 'Kaart';
  @override String get online => 'Online';
  @override String get savedMethod => 'Opgeslagen methode';

  // FAQ
  @override String get faqTitle => 'Veelgestelde vragen';
  @override String get faqIntro => 'Vind snelle antwoorden op de meestgestelde vragen over onze taxidiensten.';

  // Terms, Privacy, Legal
  @override String get termsTitle => 'Algemene voorwaarden';
  @override String get privacyTitle => 'Privacybeleid';
  @override String get legalTitle => 'Juridische kennisgeving';

  // About
  @override String get aboutTitle => 'Over Cabsy';
  @override String get aboutText => 'Cabsy biedt professionele, veilige en stipte taxiservice in Malmedy, België.';

  // Misc
  @override String get cancel => 'Annuleren';
  @override String get confirm => 'Bevestigen';
  @override String get save => 'Opslaan';
  @override String get delete => 'Verwijderen';
  @override String get edit => 'Bewerken';
  @override String get back => 'Terug';
  @override String get next => 'Volgende';
  @override String get loading => 'Laden...';
  @override String get error => 'Er is een fout opgetreden';
  @override String get success => 'Succes';
  @override String get retry => 'Opnieuw proberen';
}
