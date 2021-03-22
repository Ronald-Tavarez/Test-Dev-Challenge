// Implement a new widget
// Create a new Unit test to validate your functionality

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_dev/widgets/heading.dart';

void main() {

  testWidgets("headings contain supplied test on init", (WidgetTester tester) async {
    await tester.pumpWidget(Heading(key: ValueKey('heading'), text: 'test_000_heading'));

    final textFind = find.text('test_000_heading');
    final keyFind = find.byKey(ValueKey('heading'));

    expect(textFind, findsOneWidget);
    expect(keyFind, findsOneWidget);
  });
}