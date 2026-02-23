# l10n — Localization & Internationalization

Auto-generated localization files for the Cabsy Flutter app.

## Languages Supported

| File | Language | Code |
|------|----------|------|
| `app_localizations_fr.dart` | French (Français) | fr |
| `app_localizations_en.dart` | English | en |
| `app_localizations_de.dart` | German (Deutsch) | de |
| `app_localizations_nl.dart` | Dutch (Nederlands) | nl |

## Base Class

`app_localizations.dart` — Abstract base class with all string keys.

## Usage

In any widget:

```dart
import 'package:cabsy_app/l10n/app_localizations.dart';

// In build():
final l10n = AppLocalizations.of(context)!;
Text(l10n.homeTitle);
Button(label: l10n.submitButton);
```

## Setup in main.dart

```dart
MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  locale: const Locale('fr'), // default locale
)
```

## Adding New Strings

1. Add the string to `pubspec.yaml` ARB sources (or directly to `.arb` files)
2. Add entry to each language ARB file
3. Run code generation:

```bash
flutter gen-l10n
```

4. Use the new key in widgets

## ARB File Structure

```json
{
  "@@locale": "fr",
  "homeTitle": "Bienvenue sur Cabsy",
  "@homeTitle": {
    "description": "Main title on the home screen"
  },
  "submitButton": "Réserver",
  "@submitButton": {
    "description": "Booking submission button"
  }
}
```

## Notes

- These files are **auto-generated** — do NOT edit directly
- Edit the `.arb` source files and re-run `flutter gen-l10n`
- Keep all languages in sync (same keys)
- Default language is French (`fr`)
