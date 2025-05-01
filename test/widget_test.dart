// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:animations_galore/main.dart';
import 'package:animations_galore/animation_1_bouncing_loading_icon.dart';
import 'package:animations_galore/animation_2_flashing_power_up.dart';
import 'package:animations_galore/animation_3_pacman_spin.dart';
import 'package:animations_galore/animation_4_chomping_pacman.dart';
import 'package:animations_galore/animation_5_game_over.dart';
import 'package:animations_galore/animation_6_sound_wave_bars.dart';
import 'package:animations_galore/animation_7_pacman_size.dart';
import 'package:animations_galore/animation_8_you_win.dart';

void main() {
  testWidgets('Animation1 renders title, description, and image and handles pause/resume and reverse', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Animation1(),
    ));

    expect(find.text('Bouncing Loading PNG'), findsOneWidget);

    expect(find.textContaining('pixel-style loading'), findsOneWidget);

    expect(find.text('Pause'), findsOneWidget);
    expect(find.text('Resume'), findsNothing);

    await tester.tap(find.text('Pause'));
    await tester.pump();

    expect(find.text('Resume'), findsOneWidget);

    await tester.tap(find.text('Resume'));
    await tester.pump();

    expect(find.text('Pause'), findsOneWidget);

    await tester.tap(find.text('Reverse'));
    await tester.pump();

    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Animation4 renders title, description, and image and handles pause/resume and reverse', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Animation4(),
    ));

    expect(find.text('Pac-Man Chomping'), findsOneWidget);

    expect(find.textContaining('moving side to side'), findsOneWidget);

    expect(find.text('Pause'), findsOneWidget);
    expect(find.text('Resume'), findsNothing);

    await tester.tap(find.text('Pause'));
    await tester.pump();

    expect(find.text('Resume'), findsOneWidget);

    await tester.tap(find.text('Resume'));
    await tester.pump();

    expect(find.text('Pause'), findsOneWidget);

    await tester.tap(find.text('Reverse'));
    await tester.pump();

    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Animation7 renders title, description, and image and handles pause/resume and reverse', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Animation7()
    ));

    expect(find.text('Growing Pac-Man'), findsOneWidget);

    expect(find.textContaining('Pac-Man scales up and down'), findsOneWidget);

    expect(find.text('Pause'), findsOneWidget);
    expect(find.text('Resume'), findsNothing);

    await tester.tap(find.text('Pause'));
    await tester.pump();

    expect(find.text('Resume'), findsOneWidget);

    await tester.tap(find.text('Resume'));
    await tester.pump();

    expect(find.text('Pause'), findsOneWidget);

    await tester.tap(find.text('Reverse'));
    await tester.pump();

    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Animation2 shows layout with text and flashing power-up widget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Animation2()
    ));

    expect(find.text('Flashing Power-Up'), findsOneWidget);
    expect(find.textContaining('simulates a glowing cherry power-up'), findsOneWidget);
    expect(find.byType(AnimatedOpacity), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
  });

  testWidgets('Animation3 shows layout with text and spinning Pac-Man widget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Animation3()
    ));

    expect(find.text('Spinning Pac-Man'), findsOneWidget);
    expect(find.textContaining('Spinning Pac-Dot'), findsOneWidget);
    expect(find.byType(AnimatedRotation), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
  });

  testWidgets('Animation5 shows layout with text and GAME OVER widget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Animation5()
    ));

    expect(find.text('Glitchy Game Over'), findsOneWidget);
    expect(find.textContaining('glitching game has ended screen'), findsOneWidget);
    expect(find.text('GAME OVER'), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(AnimatedContainer), findsOneWidget);
    expect(// the general form did not work so i had to filter specifically
      find.descendant(
        of: find.byType(AnimatedContainer),
        matching: find.byType(Transform),
      ),
      findsOneWidget,
    );
  });

  testWidgets('Animation6 shows layout with text and sound wave bars', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Animation6()
    ));

    expect(find.text('Sound Wave Bars'), findsOneWidget);
    expect(find.textContaining('simulate sound wave bars'), findsOneWidget);
    expect(find.byType(Row), findsWidgets); // Multiple Rows expected (outer and bars)
    expect(find.byType(AnimatedContainer), findsNWidgets(5)); // 5 animated bars
  });

  testWidgets('Animation8 shows layout with text and You Win widget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Animation8()
    ));

    expect(find.text('You Win! Flicker'), findsOneWidget);
    expect(find.textContaining('arcade-style winning screen'), findsOneWidget);
    expect(find.byType(AnimatedScale), findsOneWidget);
    expect(find.byType(ColorFiltered), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
  });

  testWidgets('Animation2 has no pause or reverse button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Animation2()
    ));

    expect(find.text('Flashing Power-Up'), findsOneWidget);
    expect(find.textContaining('simulates a glowing cherry power-up'), findsOneWidget);
    expect(find.byType(AnimatedOpacity), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
    expect(find.text('Pause'), findsNothing);
    expect(find.text('Reverse'), findsNothing);
  });

  testWidgets('Animation3 has no pause or reverse button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Animation3()
    ));

    expect(find.text('Spinning Pac-Man'), findsOneWidget);
    expect(find.textContaining('Spinning Pac-Dot'), findsOneWidget);
    expect(find.byType(AnimatedRotation), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
    expect(find.byType(Row), findsOneWidget);
    expect(find.text('Pause'), findsNothing);
    expect(find.text('Reverse'), findsNothing);
  });
}
