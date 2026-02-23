# test — Flutter Tests

Test suite for the Cabsy Flutter application.

## Running Tests

```bash
# Run all tests
flutter test

# Run a single test file
flutter test test/widget_test.dart

# With coverage
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## Test Files

| File | Description |
|------|-------------|
| `widget_test.dart` | Basic widget smoke tests |

## Test Types

### Widget Tests (Unit)

Test individual widgets in isolation:

```dart
testWidgets('FeatureCard renders correctly', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: FeatureCard(title: 'Test', icon: Icons.star),
    ),
  );
  expect(find.text('Test'), findsOneWidget);
});
```

### Integration Tests

End-to-end tests for booking flow (see `integration_test/`):

```dart
// integration_test/booking_test.dart
testWidgets('complete booking flow', (tester) async {
  await tester.pumpWidget(MyApp());
  // Simulate user interactions
});
```

```bash
flutter test integration_test/
```

## Adding Tests

1. Create a `.dart` file in `test/` matching the source file:
   - `lib/screens/home_screen.dart` → `test/screens/home_screen_test.dart`
2. Import necessary test packages
3. Write test cases using `testWidgets` or `test`

## Dependencies

```yaml
# pubspec.yaml dev_dependencies:
flutter_test:
  sdk: flutter
integration_test:
  sdk: flutter
```

## CI/CD

Tests run automatically on push via GitHub Actions (`.github/workflows/`).

## Coverage Goals

- Widget rendering: >80%
- Business logic: >90%
- Auth flows: 100%
