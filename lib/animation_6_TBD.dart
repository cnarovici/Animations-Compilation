import 'package:flutter/material.dart';
import 'dart:math';

class Animation6 extends StatefulWidget {
  @override
  _Animation6State createState() => _Animation6State();
}

class _Animation6State extends State<Animation6> {
  List<double> heights = List.generate(5, (_) => 30.0);
  final rng = Random();

  @override
  void initState() {
    super.initState();
    _animateBars();
  }

  void _animateBars() async {
    while (mounted) {
      await Future.delayed(Duration(milliseconds: 300));
      setState(() {
        heights = List.generate(5, (_) => 20.0 + rng.nextInt(80).toDouble());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signal Bars')),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Signal Bars\n\nAnimated signal bars bouncing with different heights. Uses AnimatedContainer implicitly.',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (i) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: 20,
                    height: heights[i],
                    color: Colors.yellowAccent,
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
