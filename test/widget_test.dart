import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:javerage_timer/core/app/timer_app.dart';
import 'package:javerage_timer/features/timer/presentation/widgets/timer_text.dart';
import 'package:javerage_timer/features/timer/presentation/widgets/actions_buttons.dart';

void main() {
  testWidgets('Timer screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TimerApp());

    // Verify that the TimerScreen is rendered.
    expect(find.byType(TimerText), findsOneWidget);
    expect(find.byType(ActionsButtons), findsOneWidget);
  });
}