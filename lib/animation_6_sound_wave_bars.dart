import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class Animation6 extends StatefulWidget {
  @override
  _Animation6State createState() => _Animation6State();
}

class _Animation6State extends State<Animation6> {
  List<double> heights = List.generate(5, (_) => 30.0);
  final rng = Random();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      if (!mounted) return;
      setState(() {
        heights = List.generate(5, (_) => 20.0 + rng.nextInt(80).toDouble());
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
      appBar: AppBar(title: Text('Sound Wave Bars')),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Sound Wave Bars\n\nImplicit animation with animated bars bouncing with different heights trying to simulate sound wave bars.',
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
