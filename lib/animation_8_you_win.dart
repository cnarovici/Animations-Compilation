import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class Animation8 extends StatefulWidget {
  @override
  _Animation8State createState() => _Animation8State();
}

class _Animation8State extends State<Animation8> {
  double _scale = 1.0;
  Color _tint = Colors.orangeAccent;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startFlicker();
  }

  void _startFlicker() {
    final rng = Random();
    _timer = Timer.periodic(Duration(milliseconds: 150), (_) {
      if (!mounted) return;
      setState(() {
        _scale = 0.9 + rng.nextDouble() * 0.3;
        _tint = rng.nextBool() ? Colors.deepOrange : Colors.yellowAccent;
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
    return Scaffold(
      appBar: AppBar(title: Text('You Win! Flicker')),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'You Win! Flicker\n\nAn implicit animation that imitates an arcade-style winning screen by scaling and tinting a PNG randomly.',
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
