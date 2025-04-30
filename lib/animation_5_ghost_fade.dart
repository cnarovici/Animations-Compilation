import 'package:flutter/material.dart';
import 'dart:math';

class Animation5 extends StatefulWidget {
  @override
  _Animation5State createState() => _Animation5State();
}

class _Animation5State extends State<Animation5> {
  double _dx = 0;
  double _dy = 0;

  @override
  void initState() {
    super.initState();
    _startGlitch();
  }

  void _startGlitch() async {
    final rng = Random();
    while (mounted) {
      await Future.delayed(Duration(milliseconds: 100));
      if (!mounted) return;
      setState(() {
        _dx = (rng.nextDouble() - 0.5) * 20; // jitter -10 to +10
        _dy = (rng.nextDouble() - 0.5) * 20;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Glitchy Game Over')),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Glitchy Game Over\n\nAn implicit animation mimicking a distorted GAME OVER screen using random offset updates and Transform.translate.',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                child: Transform.translate(
                  offset: Offset(_dx, _dy),
                  child: Text(
                    'GAME OVER',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PressStart2P',
                    ),
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
