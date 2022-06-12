// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ecentialsclone/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
<<<<<<< HEAD
   // await tester.pumpWidget(const MyApp(showLogin: true, showSignup: null, ));

   // await tester.pumpWidget(const MyApp(
     // showLogin: true,
   // )
   // );

=======
<<<<<<< HEAD
    await tester.pumpWidget(const MyApp(showLogin: true, showSignup: false,));
=======
    await tester.pumpWidget(const MyApp(showLogin: true,showSignup: false,));
>>>>>>> 6d3c0e146e66abe0952f63c550194b1a8783f330
>>>>>>> e308b72a08e7b29eee2fc9a2ad0da712e155ea98

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
