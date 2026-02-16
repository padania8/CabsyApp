import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('More'),
      ),
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
                // TODO: Implement theme toggle with state management
                // Use Provider, Riverpod, or BLoC for proper implementation
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Theme toggle coming soon')),
                );
              },
            ),
          ),
          
          const Divider(),
          
          // Information Section
          _SectionHeader(title: 'Information'),
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
                    style: TextStyle(
                      color: AppTheme.grayMedium,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '© 2026 Cabsy. All rights reserved.',
                    style: TextStyle(
                      color: AppTheme.grayMedium,
                      fontSize: 12,
                    ),
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
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Language',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _LanguageOption(
              flag: '🇬🇧',
              name: 'English',
              locale: const Locale('en'),
            ),
            _LanguageOption(
              flag: '🇫🇷',
              name: 'Français',
              locale: const Locale('fr'),
            ),
            _LanguageOption(
              flag: '🇩🇪',
              name: 'Deutsch',
              locale: const Locale('de'),
            ),
            _LanguageOption(
              flag: '🇳🇱',
              name: 'Nederlands',
              locale: const Locale('nl'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAbout(BuildContext context, AppLocalizations l10n) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
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
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.aboutText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                _InfoRow(icon: Icons.location_on, text: l10n.contactAddress),
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
        builder: (context) => Scaffold(
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
                answer: 'You can book your taxi in several ways: by phone, via our website, or directly from this mobile app. We recommend booking in advance for airport trips.',
              ),
              const _FaqItem(
                question: 'What payment methods are accepted?',
                answer: 'Payment is made in advance when booking. We accept bank cards (Visa, Mastercard) and PayPal. Cash payments are also accepted.',
              ),
              const _FaqItem(
                question: 'What is Cabsy\'s coverage area?',
                answer: 'Cabsy mainly serves Malmedy and the surrounding municipalities. We also provide long-distance trips to airports and major cities.',
              ),
              const _FaqItem(
                question: 'Can I cancel my booking?',
                answer: 'Yes, you can cancel free of charge up to 24 hours before pick-up. After this period, the full amount is due.',
              ),
              const _FaqItem(
                question: 'Can I travel with my pet?',
                answer: 'Yes, pets are accepted. Small animals should be in a carrier. For large dogs, please inform us when booking.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showContact(BuildContext context, AppLocalizations l10n) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
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
                _InfoRow(
                  icon: Icons.phone,
                  text: l10n.contactPhone,
                  large: true,
                ),
                const SizedBox(height: 16),
                _InfoRow(
                  icon: Icons.email,
                  text: l10n.contactEmail,
                  large: true,
                ),
                const SizedBox(height: 16),
                _InfoRow(
                  icon: Icons.schedule,
                  text: l10n.officeHours,
                  large: true,
                ),
                const SizedBox(height: 32),
                
                // Contact Form
                Text(
                  'Send us a message',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: l10n.firstName),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(labelText: l10n.lastName),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(labelText: l10n.email),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(labelText: l10n.subject),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(labelText: l10n.message),
                  maxLines: 4,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(l10n.send),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
        builder: (context) => Scaffold(
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

  const _LanguageOption({
    required this.flag,
    required this.name,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = Localizations.localeOf(context) == locale;

    return ListTile(
      leading: Text(flag, style: const TextStyle(fontSize: 24)),
      title: Text(name),
      trailing: isSelected
          ? const Icon(Icons.check, color: AppTheme.primaryYellow)
          : null,
      selected: isSelected,
      onTap: () {
        // In a real app, use a state management solution
        Navigator.pop(context);
      },
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool large;

  const _InfoRow({
    required this.icon,
    required this.text,
    this.large = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: large ? 8 : 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: large ? 24 : 20,
            color: AppTheme.primaryYellow,
          ),
          SizedBox(width: large ? 16 : 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: large ? 16 : 14),
            ),
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
