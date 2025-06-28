import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_custom_widget/flutter_custom_widget.dart';

void main() {
  group('CustomText Widget Tests', () {
    testWidgets('should display text correctly', (WidgetTester tester) async {
      const testText = 'Hello World';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: CustomText(text: testText)),
        ),
      );

      expect(find.text(testText), findsOneWidget);
    });

    testWidgets('should apply text color correctly', (
      WidgetTester tester,
    ) async {
      const testText = 'Colored Text';
      const testColor = Colors.red;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomText(text: testText, textColor: testColor),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.color, testColor);
    });

    testWidgets('should apply font size correctly', (
      WidgetTester tester,
    ) async {
      const testText = 'Large Text';
      const testFontSize = 24.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomText(text: testText, fontSize: testFontSize),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.fontSize, testFontSize);
    });

    testWidgets('should apply font family correctly', (
      WidgetTester tester,
    ) async {
      const testText = 'Custom Font';
      const testFontFamily = 'Roboto';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomText(text: testText, fontFamily: testFontFamily),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.fontFamily, testFontFamily);
    });

    testWidgets('should apply font weight correctly', (
      WidgetTester tester,
    ) async {
      const testText = 'Bold Text';
      const testFontWeight = FontWeight.bold;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomText(text: testText, fontWeight: testFontWeight),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.fontWeight, testFontWeight);
    });

    testWidgets('should apply line height correctly', (
      WidgetTester tester,
    ) async {
      const testText = 'Text with line height';
      const testHeight = 1.5;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomText(text: testText, height: testHeight),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.height, testHeight);
    });

    testWidgets('should apply letter spacing correctly', (
      WidgetTester tester,
    ) async {
      const testText = 'Spaced Text';
      const testLetterSpacing = 2.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomText(text: testText, letterSpacing: testLetterSpacing),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.letterSpacing, testLetterSpacing);
    });

    testWidgets('should apply word spacing correctly', (
      WidgetTester tester,
    ) async {
      const testText = 'Word Spaced Text';
      const testWordSpacing = 3.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomText(text: testText, wordSpacing: testWordSpacing),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.wordSpacing, testWordSpacing);
    });

    testWidgets('should apply text alignment correctly', (
      WidgetTester tester,
    ) async {
      const testText = 'Centered Text';
      const testAlignment = TextAlign.center;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomText(text: testText, textAlign: testAlignment),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.textAlign, testAlignment);
    });

    testWidgets('should apply max lines correctly', (
      WidgetTester tester,
    ) async {
      const testText = 'Text with max lines';
      const testMaxLines = 2;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomText(text: testText, maxLines: testMaxLines),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.maxLines, testMaxLines);
    });

    testWidgets('should apply text overflow correctly', (
      WidgetTester tester,
    ) async {
      const testText = 'Text with overflow';
      const testOverflow = TextOverflow.ellipsis;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomText(text: testText, overflow: testOverflow),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.overflow, testOverflow);
    });

    testWidgets('should apply soft wrap correctly', (
      WidgetTester tester,
    ) async {
      const testText = 'Text with soft wrap disabled';
      const testSoftWrap = false;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomText(text: testText, softWrap: testSoftWrap),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.softWrap, testSoftWrap);
    });

    testWidgets('should use provided TextStyle as base', (
      WidgetTester tester,
    ) async {
      const testText = 'Text with base style';
      const baseStyle = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: Colors.blue,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomText(text: testText, style: baseStyle),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.fontSize, baseStyle.fontSize);
      expect(textWidget.style?.fontWeight, baseStyle.fontWeight);
      expect(textWidget.style?.color, baseStyle.color);
    });

    testWidgets('should override base style with specific properties', (
      WidgetTester tester,
    ) async {
      const testText = 'Text with overridden style';
      const baseStyle = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: Colors.blue,
      );
      const overrideColor = Colors.red;
      const overrideFontSize = 20.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomText(
              text: testText,
              style: baseStyle,
              textColor: overrideColor,
              fontSize: overrideFontSize,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.color, overrideColor);
      expect(textWidget.style?.fontSize, overrideFontSize);
      expect(
        textWidget.style?.fontWeight,
        baseStyle.fontWeight,
      ); // Should keep base style
    });

    testWidgets('should apply multiple properties together', (
      WidgetTester tester,
    ) async {
      const testText = 'Fully styled text';
      const testColor = Colors.green;
      const testFontSize = 18.0;
      const testFontWeight = FontWeight.w600;
      const testLetterSpacing = 1.2;
      const testAlignment = TextAlign.center;
      const testMaxLines = 3;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomText(
              text: testText,
              textColor: testColor,
              fontSize: testFontSize,
              fontWeight: testFontWeight,
              letterSpacing: testLetterSpacing,
              textAlign: testAlignment,
              maxLines: testMaxLines,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style?.color, testColor);
      expect(textWidget.style?.fontSize, testFontSize);
      expect(textWidget.style?.fontWeight, testFontWeight);
      expect(textWidget.style?.letterSpacing, testLetterSpacing);
      expect(textWidget.textAlign, testAlignment);
      expect(textWidget.maxLines, testMaxLines);
    });

    testWidgets('should have default soft wrap as true', (
      WidgetTester tester,
    ) async {
      const testText = 'Default soft wrap';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: CustomText(text: testText)),
        ),
      );

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.softWrap, true);
    });
  });
}
