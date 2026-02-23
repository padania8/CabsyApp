# lib — Flutter Application Source

Core Dart/Flutter source code for the Cabsy mobile app.

## Structure

```
lib/
├── main.dart          # App entry point
├── l10n/              # Localization (4 languages)
├── screens/           # App screens/pages
├── theme/             # App styling and theme
└── widgets/           # Reusable UI components
```

## Key Files

### main.dart
- App initialization
- MaterialApp configuration
- Root widget setup
- Localization delegates

## Subdirectories

| Folder | Purpose |
|--------|---------|
| `l10n/` | Internationalization — FR, EN, DE, NL |
| `screens/` | Full-page screen widgets |
| `theme/` | App theme, colors, typography |
| `widgets/` | Shared reusable components |

## Architecture

The app uses a simple screen-based architecture:
- Each screen is a self-contained Flutter widget
- Shared UI components are in `widgets/`
- Theming is centralized in `theme/app_theme.dart`
- Localizations are auto-generated into `l10n/`

## Adding a New Screen

1. Create `lib/screens/new_screen.dart`
2. Add a `StatefulWidget` or `StatelessWidget`
3. Register route in `main.dart` if needed
4. Add translations in `l10n/` ARB files
5. Run `flutter gen-l10n`

## Building

```bash
flutter pub get
flutter run
flutter build apk
flutter build ios
```

## Testing

```bash
flutter test
flutter test test/widget_test.dart
```
