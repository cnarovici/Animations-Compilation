import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

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
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Tap Bouncing Loading Icon navigates to Animation1 screen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Arcade Animations'), findsOneWidget);

    await tester.tap(find.text('Bouncing Loading Icon'));
    await tester.pump(); // trigger navigation
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('Bouncing Loading PNG'), findsOneWidget);
    expect(find.textContaining('pixel-style loading icon'), findsOneWidget);
  });

  testWidgets('Tap Flashing Cherry Power-Up navigates to Animation2 screen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Arcade Animations'), findsOneWidget);

    await tester.tap(find.text('Flashing Cherry Power-Up'));

    await tester.pump();
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('Flashing Power-Up'), findsOneWidget);
    expect(find.textContaining('glowing cherry power-up'), findsWidgets);
  });

  testWidgets('Tap PacSPIN navigates to Animation3 screen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Arcade Animations'), findsOneWidget);

    await tester.tap(find.text('PacSPIN'));

    await tester.pump();
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('Spinning Pac-Man'), findsOneWidget);
    expect(find.textContaining('pixelated Pacman spins'), findsWidgets);
  });

  testWidgets('Tap PacCHOMP navigates to Animation4 screen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Arcade Animations'), findsOneWidget);

    await tester.tap(find.text('PacCHOMP'));

    await tester.pump();
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('Pac-Man Chomping'), findsOneWidget);
    expect(find.textContaining('Pac-Man moving side to side'), findsWidgets);
  });

  testWidgets('Tap GAME OVER navigates to Animation5 screen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Arcade Animations'), findsOneWidget);

    await tester.tap(find.text('GAME OVER'));

    await tester.pump();
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('Glitchy Game Over'), findsOneWidget);
    expect(find.textContaining('glitching game has ended screen'), findsWidgets);
  });
}