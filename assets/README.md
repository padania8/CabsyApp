# assets — Static App Assets

Static files bundled with the Cabsy Flutter application.

## Structure

```
assets/
└── images/    # App image assets (logos, icons, illustrations)
```

## Usage in Flutter

Assets are declared in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/images/
    - assets/images/logo.png
```

Access in code:

```dart
Image.asset('assets/images/logo.png')
AssetImage('assets/images/logo.png')
```

## Naming Conventions

- `logo_*.png` — Brand logo variants
- `icon_*.png` — UI icons (use instead of Icon() when custom)
- `illustration_*.png` — Onboarding/feature illustrations
- `bg_*.png` — Background images

## Resolution-Aware Assets

For DPI-aware images, use variant folders:

```
assets/images/logo.png      (1x)
assets/images/2.0x/logo.png (2x)
assets/images/3.0x/logo.png (3x)
```

## Image Guidelines

- Compress images before committing (use TinyPNG or similar)
- Use SVG for icons when possible (via `flutter_svg`)
- Maximum size: 500KB per image
- Preferred formats: PNG (transparency), WebP (photos), SVG (vectors)

## App Icons

Main app icons are generated with `flutter_launcher_icons`:

```bash
flutter pub run flutter_launcher_icons
```

Config in `pubspec.yaml`:

```yaml
flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/images/icon.png"
```
