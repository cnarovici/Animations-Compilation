import 'package:flutter/material.dart';

class Animation3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spinning Pac-Dot'),
      ),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Spinning Pac-Dot\n\nAn implicit animation using AnimatedRotation. '
                    'A pixelated Pacman spins in place to simulate a GAME OVER.',
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

  @override
  void initState() {
    super.initState();
    _startRotation();
  }

  void _startRotation() async {
    while (mounted) {
      await Future.delayed(Duration(milliseconds: 100));
      if (!mounted) return;
      setState(() {
        _angle += 0.1;
      });
    }
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
