# Cabsy App

Official mobile application for Cabsy Taxi service (iOS and Android).

## Features

- **Home Screen** - Hero banner with Cabsy branding and quick booking access
- **Booking** - Easy taxi reservation interface
- **Profile** - User account management
- **Multi-language** - Supports French, English, German, and Dutch
- **Responsive Design** - Optimized for various screen sizes

## Assets

- `assets/images/logo.png` - Official Cabsy logo

## SDK & Environment

| Component | Version | Path |
|-----------|---------|------|
| Flutter | 3.41.2 (stable) | `/home/fmarcato/snap/flutter/common/flutter` |
| Dart | 3.11.0 | bundled with Flutter |
| Android SDK | 36.0.0 | `/home/fmarcato/Android/Sdk` |
| Android Studio | snap | `snap run android-studio` |

## Getting Started

1. Install Flutter SDK: `sudo snap install flutter --classic`
2. Install Android Studio: `sudo snap install android-studio --classic`
3. Configure Android SDK: `flutter config --android-sdk ~/Android/Sdk`
4. Accept licenses: `flutter doctor --android-licenses`
5. Run `flutter pub get`
6. Run `flutter run` with a connected device or emulator

## Resources

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter documentation](https://docs.flutter.dev/)
