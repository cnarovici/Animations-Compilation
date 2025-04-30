import 'package:flutter/material.dart';

class Animation1 extends StatefulWidget {
  @override
  _Animation1State createState() => _Animation1State();
}

class _Animation1State extends State<Animation1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isPaused = false;
  bool _isForward = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceInOut),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _isForward = false;
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _isForward = true;
        _controller.forward();
      }
    });
    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePause() {
    setState(() {
      if (_isPaused) {
        if (_isForward) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      } else {
        _controller.stop();
      }
      _isPaused = !_isPaused;
    });
  }

  void _reverseDirection() {
    if (!_isPaused) {
      setState(() {
        if (_isForward) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
        _isForward = !_isForward;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bouncing Loading PNG'),
      ),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Bouncing Loading PNG\n\nAn explicit animation that simulates a pixel-style loading icon bouncing up and down repeatedly.',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, 150 * (1 - _animation.value)),
                      child: child,
                    );
                  },
                  child: Image.asset(
                    'images/final_loading.jpg', // Ensure this file is added in pubspec.yaml
                    width: 150,
                    height: 150,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _togglePause,
                      child: Text(_isPaused ? 'Resume' : 'Pause'),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _reverseDirection,
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
