import 'app_localizations.dart';

class AppLocalizationsFr implements AppLocalizations {
  // Navigation
  @override String get navHome => 'Accueil';
  @override String get navBooking => 'Réservation';
  @override String get navServices => 'Services';
  @override String get navAbout => 'À propos';
  @override String get navContact => 'Contact';
  @override String get navFaq => 'FAQ';

  // Banner
  @override String get bannerHeading => 'Votre taxi de confiance à Malmedy';
  @override String get bannerText => 'Disponible 24h/24, 7j/7 pour tous vos trajets.';
  @override String get bookNow => 'Réserver';

  // Cards
  @override String get cardQualityTitle => 'Service de qualité';
  @override String get cardQualityText => 'Nos chauffeurs professionnels vous conduisent en toute sécurité.';
  @override String get cardEasyBookingTitle => 'Réservation facile';
  @override String get cardEasyBookingText => 'Réservez votre course en quelques clics.';
  @override String get cardPricingTitle => 'Tarifs transparents';
  @override String get cardPricingText => 'Pas de surprises, nos prix sont affichés clairement.';

  // Booking/Reservation
  @override String get reservationTitle => 'Réservation';
  @override String get reservationDescription => 'Réservez votre course facilement avec notre service en ligne.';
  @override String get pickupLabel => 'Adresse de prise en charge';
  @override String get destinationLabel => 'Destination';
  @override String get useLocation => 'Utiliser ma position';
  @override String get selectOnMap => 'Sélectionner sur la carte';
  @override String get rideType => 'Type de course';
  @override String get rideNow => 'Réserver maintenant';
  @override String get rideScheduled => 'Planifier pour plus tard';
  @override String get pickupDateTime => 'Date et heure de prise en charge';
  @override String get recurringRide => 'Course récurrente';
  @override String get fareEstimate => 'Estimation du tarif';
  @override String get luggageCount => 'Bagages volumineux';
  @override String get petCount => 'Animaux';
  @override String get airportRide => 'Navette aéroport';
  @override String get calculateFare => 'Calculer le tarif';
  @override String get paymentMethod => 'Mode de paiement';
  @override String get submitBooking => 'Réserver';

  // Contact
  @override String get contactTitle => 'Contact';
  @override String get firstName => 'Prénom';
  @override String get lastName => 'Nom';
  @override String get email => 'E-mail';
  @override String get subject => 'Sujet';
  @override String get message => 'Message';
  @override String get send => 'Envoyer';
  @override String get contactAddress => 'Rue de la gare 5 bte 18, 4960 Malmedy, Belgique';
  @override String get contactPhone => '+32 494 39 32 70';
  @override String get contactEmail => 'marcatofranco@live.fr';
  @override String get officeHours => 'Lundi au samedi: 9h-18h';

  // Login
  @override String get loginTitle => 'MyCabsy';
  @override String get driverPortal => 'Portail chauffeur';
  @override String get passengerPortal => 'Portail passager';
  @override String get password => 'Mot de passe';
  @override String get rememberMe => 'Se souvenir de moi';
  @override String get forgotPassword => 'Mot de passe oublié?';
  @override String get noAccount => 'Pas encore de compte?';
  @override String get createAccount => 'Créer un compte';

  // Signup
  @override String get signupTitle => 'Créer un compte passager';
  @override String get confirmPassword => 'Confirmer le mot de passe';
  @override String get signUp => 'S\'inscrire';
  @override String get hasAccount => 'Déjà un compte?';
  @override String get loginLink => 'Se connecter';
  @override String get passwordHint => '10 caractères minimum, avec majuscule, chiffre et caractère spécial';
  @override String get termsAgree => 'En créant un compte, vous acceptez nos conditions générales';

  // Dashboard Passenger
  @override String get dashboardPassengerTitle => 'Tableau de bord passager';
  @override String get welcome => 'Bienvenue dans votre espace MyCabsy';
  @override String get myBookings => 'Mes réservations';
  @override String get newBooking => 'Nouvelle réservation';
  @override String get profile => 'Mon profil';
  @override String get history => 'Historique des courses';
  @override String get logout => 'Déconnexion';
  @override String get noBookings => 'Aucune réservation active';
  @override String get savedLocations => 'Adresses enregistrées';
  @override String get addLocation => 'Ajouter une adresse';
  @override String get paymentMethods => 'Moyens de paiement';
  @override String get addPaymentMethod => 'Ajouter un moyen de paiement';

  // Dashboard Driver
  @override String get dashboardDriverTitle => 'Tableau de bord chauffeur';
  @override String get welcomeDriver => 'Bienvenue chauffeur';
  @override String get activeRides => 'Courses actives';
  @override String get todayStats => 'Statistiques du jour';
  @override String get earnings => 'Gains';
  @override String get completedRides => 'Courses terminées';
  @override String get availability => 'Disponibilité';
  @override String get available => 'Disponible';
  @override String get offline => 'Hors ligne';
  @override String get toggleStatus => 'Changer le statut';
  @override String get noActiveRides => 'Aucune course active';

  // 2FA
  @override String get twoFactorTitle => 'Authentification à deux facteurs';
  @override String get twoFactorDescription => 'L\'authentification à deux facteurs ajoute une couche de sécurité supplémentaire à votre compte.';
  @override String get enable2FA => 'Activer 2FA';
  @override String get disable2FA => 'Désactiver 2FA';
  @override String get status2FA => 'Statut';
  @override String get enabled => 'Activé';
  @override String get disabled => 'Désactivé';

  // Payment
  @override String get cash => 'Espèces';
  @override String get card => 'Carte';
  @override String get online => 'En ligne';
  @override String get savedMethod => 'Méthode enregistrée';

  // FAQ
  @override String get faqTitle => 'Questions fréquentes';
  @override String get faqIntro => 'Trouvez des réponses rapides aux questions les plus courantes sur nos services de taxi.';

  // Terms, Privacy, Legal
  @override String get termsTitle => 'Conditions générales';
  @override String get privacyTitle => 'Politique de confidentialité';
  @override String get legalTitle => 'Mentions légales';

  // About
  @override String get aboutTitle => 'À propos de Cabsy';
  @override String get aboutText => 'Cabsy offre un service de taxi professionnel, sûr et ponctuel à Malmedy, Belgique.';

  // Misc
  @override String get cancel => 'Annuler';
  @override String get confirm => 'Confirmer';
  @override String get save => 'Enregistrer';
  @override String get delete => 'Supprimer';
  @override String get edit => 'Modifier';
  @override String get back => 'Retour';
  @override String get next => 'Suivant';
  @override String get loading => 'Chargement...';
  @override String get error => 'Une erreur est survenue';
  @override String get success => 'Succès';
  @override String get retry => 'Réessayer';
}
