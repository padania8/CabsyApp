# Copilot Instructions

## ⚠️ MANDATORY FIRST STEP

**BEFORE making ANY code changes to this project:**

1. **STOP** - Do not write or modify any code yet
2. **READ** these files from `H:\Codes\Server\`:
   - `AGENTS.md` - Critical rules and security requirements
   - `SECURITY.md` - Mandatory security and legal compliance
   - `projects/cabsy_app.md` - Cabsy App-specific context

**This is NOT optional. Failure to read these files first may result in non-compliant or vulnerable code.**

## Project Overview

| Property | Value |
|----------|-------|
| Name | Cabsy App |
| Type | Flutter mobile application |
| Platforms | iOS, Android |
| Language | Dart/Flutter |

## Server Documentation

All server configuration, security requirements, and deployment instructions are in:
```
H:\Codes\Server\
├── AGENTS.md          ← Read this FIRST
├── SECURITY.md        ← Security & legal requirements
├── SERVER_STATUS.md   ← Current server state
└── projects/
    └── cabsy_app.md   ← This project's context
```

## Code Requirements

All code MUST:
- ✅ Be secure (no hardcoded credentials, secure API calls)
- ✅ Be GDPR compliant (encrypt PII, proper consent flows)
- ✅ Follow Flutter/Dart best practices
- ✅ Pass all tests before commit

## ⚠️ MANDATORY: Server Update on Every Connection

**At the FIRST SSH connection of each session, ALWAYS run:**
```bash
ssh root@65.21.148.1 "apt update && apt upgrade -y"
```

This is **NON-NEGOTIABLE**. Security patches must be applied immediately.

## Quick Commands

```bash
# Get dependencies
flutter pub get

# Run tests
flutter test

# Build APK
flutter build apk

# Build iOS
flutter build ios

# Run app
flutter run
```

## ⚠️ MANDATORY: MD Files in Every Commit

**Every `commit` and `push` operation MUST include updates to relevant `.md` files.**

### Required on Every Commit

1. **CHANGELOG.md** (if it exists) — Add entry describing what changed
2. **Folder README.md** — Update the README.md of any folder whose files were modified
3. **pubspec.yaml** comments — Update if dependencies changed

### Which Files to Update

| Change Type | MD Files to Update |
|-------------|-------------------|
| New screen | `lib/screens/README.md`, `CHANGELOG.md` |
| New widget | `lib/widgets/README.md`, `CHANGELOG.md` |
| New locale string | `lib/l10n/README.md`, `CHANGELOG.md` |
| New asset | `assets/README.md`, `CHANGELOG.md` |
| New test | `test/README.md`, `CHANGELOG.md` |
| Bug fix | `CHANGELOG.md` |
| New dependency | `README.md`, `CHANGELOG.md` |

### Commit Message Format

```
type: Short description

- Detail of change 1
- Detail of change 2

MD files updated: CHANGELOG.md, [other files]
```

**This rule is NON-NEGOTIABLE. No commit should ever be pushed without updating MD files.**
