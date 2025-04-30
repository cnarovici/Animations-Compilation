import 'package:flutter/material.dart';

class Animation7 extends StatefulWidget {
  @override
  _Animation7State createState() => _Animation7State();
}

class _Animation7State extends State<Animation7> {
  double _scale = 1.0;
  bool _growing = true;

  @override
  void initState() {
    super.initState();
    _startScaling();
  }

  void _startScaling() async {
    while (mounted) {
      await Future.delayed(Duration(milliseconds: 500));
      if (!mounted) return;
      setState(() {
        _scale = _growing ? 1.5 : 1.0;
        _growing = !_growing;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Growing Pacman')),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Growing Pacman\n\nAn implicit animation using AnimatedScale. '
                    'Pacman gradually grows and shrinks in a loop, mimicking a power-up effect.',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: AnimatedScale(
                scale: _scale,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Image.asset(
                  'images/pacman.png',
                  width: 60,
                  height: 60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
