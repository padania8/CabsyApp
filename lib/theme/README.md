# theme — App Theme & Styling

Centralized theme configuration for the Cabsy Flutter app.

## Files

| File | Description |
|------|-------------|
| `app_theme.dart` | Main theme definition (colors, fonts, components) |

## Usage

The theme is applied at the app root in `main.dart`:

```dart
MaterialApp(
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  // ...
)
```

In widgets, access theme values:

```dart
// Colors
Theme.of(context).colorScheme.primary
Theme.of(context).colorScheme.surface

// Text styles
Theme.of(context).textTheme.headlineLarge

// Custom extensions (if defined)
Theme.of(context).extension<AppColors>()!.primaryBlue
```

## Brand Colors

Cabsy brand palette:

| Name | Hex | Usage |
|------|-----|-------|
| Primary Blue | `#003366` | Headers, navigation |
| Primary Yellow | `#FFD700` | Accents, CTA buttons |
| Text Dark | `#222222` | Body text |
| Background | `#FFFFFF` | Page backgrounds |

## Typography

Font hierarchy:
- **Display**: Bold headings
- **Headline**: Section titles
- **Body**: Regular content
- **Label**: Form labels, captions

## Customizing the Theme

Edit `app_theme.dart` to change:
- `ThemeData` for Material 3
- `ColorScheme` for brand colors
- `TextTheme` for typography
- Component themes (`ElevatedButtonThemeData`, etc.)

## Dark Mode

Both light and dark themes should be defined to support system preferences.
