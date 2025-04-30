import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Animation8 extends StatefulWidget {
  @override
  _Animation8State createState() => _Animation8State();
}

class _Animation8State extends State<Animation8> {
  double _scale = 1.0;
  Color _tint = Colors.orangeAccent;
  late Timer _flickerTimer;

  @override
  void initState() {
    super.initState();
    _startFlicker();
  }

  void _startFlicker() {
    final rng = Random();
    _flickerTimer = Timer.periodic(Duration(milliseconds: 150), (_) {
      setState(() {
        _scale = 0.9 + rng.nextDouble() * 0.3; // between 0.9 and 1.2
        _tint = rng.nextBool() ? Colors.deepOrange : Colors.yellowAccent;
      });
    });
  }

  @override
  void dispose() {
    _flickerTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pixel Flame Flicker')),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Pixel Flame Flicker\n\nThis animation simulates a classic arcade-style flame by scaling and tinting a flame PNG in rapid bursts.',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: AnimatedScale(
                scale: _scale,
                duration: Duration(milliseconds: 100),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(_tint, BlendMode.modulate),
                  child: Image.asset(
                    'images/you_win.png',
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
