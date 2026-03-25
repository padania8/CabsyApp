import 'app_localizations.dart';

class AppLocalizationsIt implements AppLocalizations {
  // Navigation
  @override
  String get navHome => 'Home';
  @override
  String get navBooking => 'Prenotazione';
  @override
  String get navServices => 'Servizi';
  @override
  String get navAbout => 'Chi siamo';
  @override
  String get navContact => 'Contatto';
  @override
  String get navFaq => 'FAQ';

  // Banner
  @override
  String get bannerHeading => 'Il vostro taxi di fiducia a Malmedy';
  @override
  String get bannerText => 'Disponibile 24/7 per tutti i vostri spostamenti.';
  @override
  String get bookNow => 'Prenota ora';

  // Cards
  @override
  String get cardQualityTitle => 'Servizio di qualità';
  @override
  String get cardQualityText =>
      'I nostri autisti professionisti vi trasportano in sicurezza.';
  @override
  String get cardEasyBookingTitle => 'Prenotazione facile';
  @override
  String get cardEasyBookingText =>
      'Prenotate il vostro viaggio in pochi clic.';
  @override
  String get cardPricingTitle => 'Tariffe trasparenti';
  @override
  String get cardPricingText =>
      'Nessuna sorpresa, le nostre tariffe sono chiaramente indicate.';

  // Booking/Reservation
  @override
  String get reservationTitle => 'Prenotazione';
  @override
  String get reservationDescription =>
      'Prenotate il vostro viaggio facilmente con il nostro servizio online.';
  @override
  String get pickupLabel => 'Indirizzo di partenza';
  @override
  String get destinationLabel => 'Destinazione';
  @override
  String get useLocation => 'Usa la mia posizione';
  @override
  String get selectOnMap => 'Seleziona sulla mappa';
  @override
  String get rideType => 'Tipo di corsa';
  @override
  String get rideNow => 'Prenota ora';
  @override
  String get rideScheduled => 'Programma per dopo';
  @override
  String get pickupDateTime => 'Data e ora di partenza';
  @override
  String get recurringRide => 'Corsa ricorrente';
  @override
  String get fareEstimate => 'Stima della tariffa';
  @override
  String get luggageCount => 'Bagagli voluminosi';
  @override
  String get petCount => 'Animali domestici';
  @override
  String get airportRide => 'Transfer aeroporto';
  @override
  String get calculateFare => 'Calcola la tariffa';
  @override
  String get paymentMethod => 'Metodo di pagamento';
  @override
  String get submitBooking => 'Prenota';

  // Contact
  @override
  String get contactTitle => 'Contatto';
  @override
  String get firstName => 'Nome';
  @override
  String get lastName => 'Cognome';
  @override
  String get email => 'E-mail';
  @override
  String get subject => 'Oggetto';
  @override
  String get message => 'Messaggio';
  @override
  String get send => 'Invia';
  @override
  String get contactAddress => 'Rue de la gare 5 bte 18, 4960 Malmedy, Belgio';
  @override
  String get contactPhone => '+32 494 39 32 70';
  @override
  String get contactEmail => 'marcatofranco@live.fr';
  @override
  String get officeHours => 'Dal lunedì al sabato: 9-18';

  // Login
  @override
  String get loginTitle => 'MyCabsy';
  @override
  String get driverPortal => 'Portale autista';
  @override
  String get passengerPortal => 'Portale passeggero';
  @override
  String get password => 'Password';
  @override
  String get rememberMe => 'Ricordami';
  @override
  String get forgotPassword => 'Password dimenticata?';
  @override
  String get noAccount => 'Non hai un account?';
  @override
  String get createAccount => 'Crea account';

  // Signup
  @override
  String get signupTitle => 'Crea account passeggero';
  @override
  String get confirmPassword => 'Conferma password';
  @override
  String get signUp => 'Registrati';
  @override
  String get hasAccount => 'Hai già un account?';
  @override
  String get loginLink => 'Accedi';
  @override
  String get passwordHint =>
      'Minimo 10 caratteri con maiuscola, cifra e carattere speciale';
  @override
  String get termsAgree =>
      'Creando un account, accetti i nostri termini e condizioni';

  // Dashboard Passenger
  @override
  String get dashboardPassengerTitle => 'Dashboard Passeggero';
  @override
  String get welcome => 'Benvenuto nel tuo spazio MyCabsy';
  @override
  String get myBookings => 'Le mie prenotazioni';
  @override
  String get newBooking => 'Nuova prenotazione';
  @override
  String get profile => 'Il mio profilo';
  @override
  String get history => 'Storico corse';
  @override
  String get logout => 'Esci';
  @override
  String get noBookings => 'Nessuna prenotazione attiva';
  @override
  String get savedLocations => 'Indirizzi salvati';
  @override
  String get addLocation => 'Aggiungi indirizzo';
  @override
  String get paymentMethods => 'Metodi di pagamento';
  @override
  String get addPaymentMethod => 'Aggiungi metodo di pagamento';

  // Dashboard Driver
  @override
  String get dashboardDriverTitle => 'Dashboard Autista';
  @override
  String get welcomeDriver => 'Benvenuto autista';
  @override
  String get activeRides => 'Corse attive';
  @override
  String get todayStats => 'Statistiche del giorno';
  @override
  String get earnings => 'Guadagni';
  @override
  String get completedRides => 'Corse completate';
  @override
  String get availability => 'Disponibilità';
  @override
  String get available => 'Disponibile';
  @override
  String get offline => 'Non in linea';
  @override
  String get toggleStatus => 'Cambia stato';
  @override
  String get noActiveRides => 'Nessuna corsa attiva';

  // 2FA
  @override
  String get twoFactorTitle => 'Autenticazione a due fattori';
  @override
  String get twoFactorDescription =>
      'L\'autenticazione a due fattori aggiunge un ulteriore livello di sicurezza al tuo account.';
  @override
  String get enable2FA => 'Attiva 2FA';
  @override
  String get disable2FA => 'Disattiva 2FA';
  @override
  String get status2FA => 'Stato';
  @override
  String get enabled => 'Attivato';
  @override
  String get disabled => 'Disattivato';

  // Payment
  @override
  String get cash => 'Contanti';
  @override
  String get card => 'Carta';
  @override
  String get online => 'Online';
  @override
  String get savedMethod => 'Metodo salvato';

  // FAQ
  @override
  String get faqTitle => 'Domande frequenti';
  @override
  String get faqIntro =>
      'Trova risposte rapide alle domande più comuni sui nostri servizi taxi.';

  // Terms, Privacy, Legal
  @override
  String get termsTitle => 'Termini e condizioni';
  @override
  String get privacyTitle => 'Informativa sulla privacy';
  @override
  String get legalTitle => 'Note legali';

  // About
  @override
  String get aboutTitle => 'Chi è Cabsy';
  @override
  String get aboutText =>
      'Cabsy offre un servizio taxi professionale, sicuro e puntuale a Malmedy, Belgio.';

  // Services
  @override
  String get servicesTitle => 'I nostri servizi';
  @override
  String get servicesIntro =>
      'Cabsy offre una gamma completa di servizi di trasporto taxi per soddisfare tutte le vostre esigenze.';
  @override
  String get serviceLocalTitle => 'Trasporto locale';
  @override
  String get serviceLocalDesc =>
      'Trasporto in tutta la zona di Malmedy e comuni limitrofi.';
  @override
  String get serviceAirportTitle => 'Transfer aeroporto';
  @override
  String get serviceAirportDesc =>
      'Servizio navetta verso e dagli aeroporti del Belgio: Bruxelles, Charleroi, Liegi.';
  @override
  String get serviceLongDistanceTitle => 'Lunga distanza';
  @override
  String get serviceLongDistanceDesc =>
      'Viaggi verso le principali città del Belgio, Lussemburgo, Germania e Paesi Bassi.';
  @override
  String get serviceBusinessTitle => 'Servizio business';
  @override
  String get serviceBusinessDesc =>
      'Fatturazione aziendale, account multi-utente e programmazione regolare per professionisti.';
  @override
  String get serviceAccessibleTitle => 'Trasporto accessibile';
  @override
  String get serviceAccessibleDesc =>
      'Veicolo adattato per persone a mobilità ridotta per viaggiare comodamente.';
  @override
  String get serviceScheduledTitle => 'Corse programmate';
  @override
  String get serviceScheduledDesc =>
      'Prenotate in anticipo le vostre corse ricorrenti: lavoro, scuola, appuntamenti medici.';

  // Tariffs
  @override
  String get tariffsTitle => 'Le nostre tariffe';
  @override
  String get tariffsIntro =>
      'I nostri prezzi sono calcolati secondo le tariffe legali del taxi in vigore in Belgio.';
  @override
  String get baseFare => 'Tariffa base';
  @override
  String get perKm => 'Prezzo al km';
  @override
  String get perMinute => 'Prezzo al minuto';
  @override
  String get minimumFare => 'Tariffa minima';
  @override
  String get maximumFare => 'Tariffa massima';
  @override
  String get nightSurcharge => 'Supplemento notturno (22h-6h)';
  @override
  String get sundaySurcharge => 'Supplemento domenicale';
  @override
  String get holidaySurcharge => 'Supplemento festivo';
  @override
  String get shortNoticeSurcharge => 'Supplemento prenotazione urgente';
  @override
  String get earlyBookingDiscount => 'Sconto prenotazione anticipata';
  @override
  String get luggageFee => 'Supplemento bagaglio (per bagaglio extra)';
  @override
  String get petFee => 'Supplemento animale domestico';
  @override
  String get airportFee => 'Supplemento aeroporto';
  @override
  String get surcharges => 'Supplementi orari';
  @override
  String get extraFees => 'Costi aggiuntivi';
  @override
  String get regulationInfo =>
      'Tutti i prezzi sono comprensivi di IVA e conformi alla normativa belga sui taxi.';

  // Misc
  @override
  String get cancel => 'Annulla';
  @override
  String get confirm => 'Conferma';
  @override
  String get save => 'Salva';
  @override
  String get delete => 'Elimina';
  @override
  String get edit => 'Modifica';
  @override
  String get back => 'Indietro';
  @override
  String get next => 'Avanti';
  @override
  String get loading => 'Caricamento...';
  @override
  String get error => 'Si è verificato un errore';
  @override
  String get success => 'Successo';
  @override
  String get retry => 'Riprova';
  @override
  String get contactFormSent =>
      'Il vostro messaggio è stato inviato con successo. Vi risponderemo al più presto.';
  @override
  String get phone => 'Telefono';
}
