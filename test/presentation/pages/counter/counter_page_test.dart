import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_lecture_app/presentation/pages/counter/counter_page.dart';

void main() {
  test_widget_counter_page();
  test_integration_counter_page();
}

void test_widget_counter_page() {
  testWidgets(
    "User sees two FABs—increment and decrement. If user clicks the increment FAB, the text will change from 0 to 1",
    (widgetTester) async {
      await widgetTester.pumpWidget(
        const ScreenUtilInit(
          designSize: Size(360, 690),
          child: MaterialApp(
            home: CounterPage(),
          ),
        ),
      );
      await widgetTester.pump();

      final incrementFAB = find.byKey(CounterView.keyFABIncrement);
      final textCounter = find.byKey(CounterView.keyTextCounter);

      expect(incrementFAB, findsOneWidget);
      expect(textCounter, findsOneWidget);

      await widgetTester.tap(incrementFAB);
      await widgetTester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
    },
  );
}

void test_integration_counter_page() {
  testWidgets(
    '''Scenario: User should be able to see all three widgets: FAB (+), FAB (-), and Text. 
    Given the user presses the FAB (+), Then the user should see the text '0' changes into
    '1'
    Given the user presses the FAB (-), Then the user should see the text '1' back into '0'
    ''',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        const ScreenUtilInit(
          designSize: Size(360, 690),
          child: MaterialApp(
            home: CounterPage(),
          ),
        ),
      );
      await widgetTester.pump();

      final incrementFAB = find.byKey(CounterView.keyFABIncrement);
      final decrementFAB = find.byKey(CounterView.keyFABDecrement);
      final textCounter = find.byKey(CounterView.keyTextCounter);

      expect(incrementFAB, findsOneWidget);
      expect(textCounter, findsOneWidget);
      expect(decrementFAB, findsOneWidget);

      await widgetTester.tap(incrementFAB);
      await widgetTester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);

      await widgetTester.tap(decrementFAB);
      await widgetTester.pumpAndSettle();

      expect(find.text('0'), findsOneWidget);
    },
  );
}
