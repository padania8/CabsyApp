# screens — App Screens

All full-page screen widgets for the Cabsy Flutter application.

## Screens

| File | Description |
|------|-------------|
| `home_screen.dart` | Main home screen with services overview |
| `booking_screen.dart` | Ride booking form with map |
| `main_navigation.dart` | Bottom navigation shell |
| `profile_screen.dart` | User profile and settings |
| `more_screen.dart` | Additional options menu |
| `auth/` | Authentication screens |

## auth/ Subdirectory

Contains login, signup, and password reset screens.

## Screen Pattern

All screens follow this pattern:

```dart
class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.screenTitle)),
      body: // Screen content
    );
  }
}
```

## Localization

Screens use generated localization via:

```dart
import 'package:cabsy_app/l10n/app_localizations.dart';

// In build():
final l10n = AppLocalizations.of(context)!;
Text(l10n.someString);
```

## Navigation

Navigate between screens:

```dart
Navigator.pushNamed(context, '/booking');
// or
Navigator.push(context, MaterialPageRoute(builder: (_) => BookingScreen()));
```

## Adding a New Screen

1. Create `screens/new_screen.dart`
2. Extend `StatefulWidget` or `StatelessWidget`
3. Add translations to `l10n/*.arb` files
4. Run `flutter gen-l10n`
5. Register route in `main.dart`
