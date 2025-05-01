import 'package:flutter/material.dart';
import 'dart:async';

class Animation2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashing Power-Up'),
      ),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Flashing Power-Up\n\nAn implicit animation that simulates a glowing cherry power-up about to expire.',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: FlashingPowerUp(),
          ),
        ],
      ),
    );
  }
}

class FlashingPowerUp extends StatefulWidget {
  @override
  _FlashingPowerUpState createState() => _FlashingPowerUpState();
}

class _FlashingPowerUpState extends State<FlashingPowerUp> {
  double _opacity = 1.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startFlashing();
  }

  void _startFlashing() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (_) {
      if (!mounted) return;
      setState(() {
        _opacity = _opacity == 1.0 ? 0.3 : 1.0;
      });
    });
  }

  @override
  void dispose() { // tests kept failing because timer would persist for all my implicit animations
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(milliseconds: 400),
        child: Image.asset(
          'images/cherry.png',
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}
