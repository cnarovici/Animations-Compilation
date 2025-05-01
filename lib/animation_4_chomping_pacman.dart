import 'package:flutter/material.dart';

class Animation4 extends StatefulWidget {
  @override
  _Animation4State createState() => _Animation4State();
}

class _Animation4State extends State<Animation4> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isPaused = false;
  bool isReversed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
  }

  void _togglePauseResume() {
    setState(() {
      if (isPaused) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
      isPaused = !isPaused;
    });
  }

  void _toggleReverse() {
    if (!isPaused) {
      setState(() {
        isReversed = !isReversed;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pac-Man Chomping'),
      ),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Pac-Man Chomping\n\nAn explicit animation of Pac-Man moving side to side as if he was trying to eat pac-dots.',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    final dx = isReversed ? 150 - (_controller.value * 150) : _controller.value * 150;
                    return Transform.translate(
                      offset: Offset(dx, 0),
                      child: child,
                    );
                  },
                  child: Image.asset(
                    'images/pacman.png', // Make sure this image is in your assets
                    width: 60,
                    height: 60,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _togglePauseResume,
                      child: Text(isPaused ? 'Resume' : 'Pause'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _toggleReverse,
                      child: Text('Reverse'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
