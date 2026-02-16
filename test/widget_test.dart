// Basic Flutter widget test for Cabsy app

import 'package:flutter_test/flutter_test.dart';

import 'package:cabsy_app/main.dart';

void main() {
  testWidgets('Cabsy app launches correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CabsyApp());

    // Wait for the app to settle
    await tester.pumpAndSettle();

    // Verify the app title or a key element exists
    expect(find.text('Cabsy'), findsWidgets);
  });
}
