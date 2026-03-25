# Changelog

All notable changes to the Cabsy Flutter app will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added — Website Feature Sync

- **Italian locale** (`app_localizations_it.dart`) — 5th language matching CabsyWeb (FR, EN, DE, NL, IT)
- **Services screen** — 6 service cards (Local, Airport, Long Distance, Business, Accessible, Scheduled) matching website content
- **Tariffs/Pricing screen** — 3 pricing cards with Belgian taxi rates (€8 base, €3/km, €1/min) plus surcharges and extras
- **~30 new localization keys** across all 5 languages — Services, Tariffs, contact form, phone field
- **FAQ expanded** from 5 to 11 items matching website FAQ content (added: rates, airport, scheduling, minimum fare, business, accessibility)
- **About screen expanded** with stats section (24/7, 10+ years, 5000+ rides, 98% satisfaction)
- **Contact form** converted to StatefulWidget with validation and submit confirmation message

### Changed — Website Feature Sync

- **Dark mode toggle** now functional — wired to `CabsyApp.of(context)?.setThemeMode()`
- **Language selector** now functional — wired to `CabsyApp.of(context)?.setLocale()`, includes Italian flag
- **Fare calculation** rewritten to match website's Belgian pricing: base fare + distance + time, with night/Sunday/holiday surcharges, luggage/pet/airport fees, minimum fare enforcement
- **Quick actions** (Airport, Schedule, Recurring) on home screen now navigate to BookingScreen with preset parameters
- **BookingScreen** accepts `presetAirport`, `presetScheduled`, `presetRecurring` named parameters
- **pubspec.yaml** — Added `assets/images/` to Flutter assets declaration (fixes logo loading)
- **main.dart** — Added `CabsyApp.of(context)` static accessor for locale/theme state management

### Previous (Unreleased)

- **VS Code settings** (`.vscode/settings.json`) — Flutter & Dart SDK paths, format-on-save, Dart editor config
- **Flutter SDK 3.41.2** installed (snap) with Dart 3.11.0
- **Android SDK 36** configured with build-tools and licenses accepted
- **pubspec.lock** — Updated 11 transitive dependencies to latest compatible versions

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
