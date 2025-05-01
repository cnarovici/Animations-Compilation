import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'animation_1_bouncing_loading_icon.dart';
import 'animation_2_flashing_power_up.dart';
import 'animation_3_pacman_spin.dart';
import 'animation_4_chomping_pacman.dart';
import 'animation_5_game_over.dart';
import 'animation_6_sound_wave_bars.dart';
import 'animation_7_pacman_size.dart';
import 'animation_8_you_win.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArcadeFX',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.purple,
        fontFamily: 'PressStart2P', //!! NOTE TO SELF Make sure to add this font in pubspec.yaml !!
      ),
      home: AnimationListScreen(),
    );
  }
}

class AnimationListScreen extends StatelessWidget {
  final List<_AnimationItem> animations = [
    _AnimationItem('Bouncing Loading Icon', Animation1()),
    _AnimationItem('Flashing Cherry Power-Up', Animation2()),
    _AnimationItem('PacSPIN', Animation3()),
    _AnimationItem('PacCHOMP', Animation4()),
    _AnimationItem('GAME OVER', Animation5()),
    _AnimationItem('Sound Wave Bars', Animation6()),
    _AnimationItem('PacGROW', Animation7()),
    _AnimationItem('You Win!', Animation8())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arcade Animations'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3,
          ),
          itemCount: animations.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple.shade700,
              ),
              onPressed: () => _navigateToAnimation(context, animations[index].screen, index),
              child: Text(
                animations[index].title,
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      ),
    );
  }

  void _navigateToAnimation(BuildContext context, Widget screen, int index) {
    final transitions = [
      _slideFromBottomTransition,
      _fadeScaleTransition,
      _rotateTransition,
      _horizontalSlideBlur,
      _zoomOutInvert,
      _dropShadowTransition,
      _diagonalSwipeTransition,
      _pixelExplodeTransition,
    ];

    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (_, __, ___) => screen,
      transitionsBuilder: transitions[index],
    ));
  }
}

class _AnimationItem {
  final String title;
  final Widget screen;
  _AnimationItem(this.title, this.screen);
}

Widget _slideFromBottomTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(parent: animation, curve: Curves.easeOutBack)),
    child: child,
  );
}

Widget _fadeScaleTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(
    opacity: animation,
    child: ScaleTransition(scale: animation, child: child),
  );
}

Widget _rotateTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return RotationTransition(turns: animation, child: child);
}

Widget _horizontalSlideBlur(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
    child: child,
  );
}

Widget _zoomOutInvert(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return ScaleTransition(
    scale: Tween<double>(begin: 2.0, end: 1.0).animate(animation),
    child: ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.black, BlendMode.difference),
      child: child,
    ),
  );
}

Widget _dropShadowTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(begin: Offset(0, -1), end: Offset.zero)
        .animate(animation),
    child: child,
  );
}

Widget _diagonalSwipeTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(begin: Offset(-1, -1), end: Offset.zero)
        .animate(animation),
    child: child,
  );
}

Widget _pixelExplodeTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}
