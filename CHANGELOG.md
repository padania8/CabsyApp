# Changelog

All notable changes to the Cabsy Flutter app will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- **VS Code settings** (`.vscode/settings.json`) — Flutter & Dart SDK paths, format-on-save, Dart editor config
- **Flutter SDK 3.41.2** installed (snap) with Dart 3.11.0
- **Android SDK 36** configured with build-tools and licenses accepted

### Changed

- **pubspec.lock** — Updated 11 transitive dependencies to latest compatible versions

### Infrastructure

- PATH configured with `/snap/bin` in `~/.bashrc`
- Android SDK path linked via `flutter config --android-sdk`
- `flutter pub get` resolved all dependencies

---

## [1.0.1-dev] - 2026-02-16

### Added

- **README.md files** added to all project folders for developer documentation:
  - `lib/README.md` — Source code structure overview
  - `lib/screens/README.md` — Screen widgets guide
  - `lib/widgets/README.md` — Reusable components guide
  - `lib/theme/README.md` — App theming and colors
  - `lib/l10n/README.md` — Localization and translations guide
  - `assets/README.md` — Static assets documentation
  - `test/README.md` — Test suite guide
- **copilot-instructions.md** updated with mandatory MD file update rule on every commit

## [1.0.0] - 2026-02-16

### Added

- Initial Flutter application structure
- Home screen with service overview
- Booking screen with map integration
- Profile screen for user settings
- Multi-language support (FR, EN, DE, NL)
- Bottom navigation with 4 tabs
- Reusable `FeatureCard` widget
- App theme with Cabsy brand colors
- Basic widget tests
- Android build configuration
- iOS build configuration

### Platform Support

- Android (min SDK 21)
- iOS (min SDK 12)
