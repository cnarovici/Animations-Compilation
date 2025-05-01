import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class Animation5 extends StatefulWidget {
  @override
  _Animation5State createState() => _Animation5State();
}

class _Animation5State extends State<Animation5> {
  double _dx = 0;
  double _dy = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    final rng = Random();
    _timer = Timer.periodic(Duration(milliseconds: 100), (_) {
      if (!mounted) return;
      setState(() {
        _dx = (rng.nextDouble() - 0.5) * 20;
        _dy = (rng.nextDouble() - 0.5) * 20;
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
      appBar: AppBar(title: Text('Glitchy Game Over')),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Game is Over\n\nAn implicit animation imitating a glitching game has ended screen using random offset updates.',
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
