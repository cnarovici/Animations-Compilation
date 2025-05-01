import 'package:flutter/material.dart';
import 'dart:async';

class Animation3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spinning Pac-Man'),
      ),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Spinning Pac-Dot\n\nAn implicit animation so that a pixelated Pacman spins in place to simulate a GAME OVER like in the older games.',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: SpinningPacMan(),
          ),
        ],
      ),
    );
  }
}

class SpinningPacMan extends StatefulWidget {
  @override
  _SpinningPacManState createState() => _SpinningPacManState();
}

class _SpinningPacManState extends State<SpinningPacMan> {
  double _angle = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 100), (_) {
      if (!mounted) return;
      setState(() {
        _angle += 0.1;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedRotation(
        turns: _angle,
        duration: Duration(milliseconds: 100),
        child: Image.asset(
          'images/pacman.png',
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
