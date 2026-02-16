import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import 'auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Simulated auth state - replace with real auth later
  bool _isLoggedIn = false;
  String _userName = '';
  bool _is2FAEnabled = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (!_isLoggedIn) {
      return _buildLoginPrompt(context, l10n);
    }

    return _buildDashboard(context, l10n);
  }

  Widget _buildLoginPrompt(BuildContext context, AppLocalizations l10n) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.loginTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
              const SizedBox(height: 32),
              Text(
                l10n.loginTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Access your MyCabsy account',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.grayMedium,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(
                          isDriver: false,
                          onLoginSuccess: (name) {
                            setState(() {
                              _isLoggedIn = true;
                              _userName = name;
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    );
                  },
                  child: Text(l10n.passengerPortal),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(
                          isDriver: true,
                          onLoginSuccess: (name) {
                            setState(() {
                              _isLoggedIn = true;
                              _userName = name;
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    );
                  },
                  child: Text(l10n.driverPortal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboard(BuildContext context, AppLocalizations l10n) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dashboardPassengerTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              setState(() {
                _isLoggedIn = false;
                _userName = '';
              });
            },
            tooltip: l10n.logout,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppTheme.primaryYellow,
                      child: Text(
                        _userName.isNotEmpty ? _userName[0].toUpperCase() : 'U',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryBlack,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.welcome,
                            style: TextStyle(
                              color: AppTheme.grayMedium,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            _userName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Quick Actions
            Row(
              children: [
                Expanded(
                  child: _DashboardActionCard(
                    icon: Icons.add,
                    label: l10n.newBooking,
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _DashboardActionCard(
                    icon: Icons.history,
                    label: l10n.history,
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 2FA Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.security, color: AppTheme.primaryBlack),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            l10n.twoFactorTitle,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.twoFactorDescription,
                      style: TextStyle(
                        color: AppTheme.grayMedium,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('${l10n.status2FA}: '),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: _is2FAEnabled
                                    ? AppTheme.successBg
                                    : AppTheme.errorBg,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                _is2FAEnabled ? l10n.enabled : l10n.disabled,
                                style: TextStyle(
                                  color: _is2FAEnabled
                                      ? AppTheme.successText
                                      : AppTheme.errorText,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _is2FAEnabled = !_is2FAEnabled;
                            });
                          },
                          child: Text(
                            _is2FAEnabled ? l10n.disable2FA : l10n.enable2FA,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // My Bookings Section
            Text(
              l10n.myBookings,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.inbox_outlined,
                        size: 48,
                        color: AppTheme.grayMedium,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        l10n.noBookings,
                        style: TextStyle(color: AppTheme.grayMedium),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Saved Locations
            _DashboardSection(
              title: l10n.savedLocations,
              actionLabel: l10n.addLocation,
              onAction: () {},
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text('No saved locations'),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Payment Methods
            _DashboardSection(
              title: l10n.paymentMethods,
              actionLabel: l10n.addPaymentMethod,
              onAction: () {},
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text('No payment methods'),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _DashboardActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DashboardActionCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.primaryYellow.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: AppTheme.primaryBlack),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardSection extends StatelessWidget {
  final String title;
  final String actionLabel;
  final VoidCallback onAction;
  final Widget child;

  const _DashboardSection({
    required this.title,
    required this.actionLabel,
    required this.onAction,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            TextButton.icon(
              onPressed: onAction,
              icon: const Icon(Icons.add, size: 18),
              label: Text(actionLabel),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Card(child: child),
      ],
    );
  }
}
