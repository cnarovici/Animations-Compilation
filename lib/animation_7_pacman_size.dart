import 'package:flutter/material.dart';

class Animation7 extends StatefulWidget {
  @override
  _Animation7State createState() => _Animation7State();
}

class _Animation7State extends State<Animation7> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool isPaused = false;
  bool isReversed = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _updateAnimation();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    // Start the animation
    _controller.forward();
  }

  void _updateAnimation() {
    // Set animation based on direction
    _scaleAnimation = Tween<double>(
      begin: isReversed ? 1.5 : 1.0,
      end: isReversed ? 1.0 : 1.5,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _togglePauseResume() {
    setState(() {
      isPaused = !isPaused;

      if (isPaused) {
        // Store the current position when pausing
        _controller.stop();
      } else {
        // Resume from current position in the proper direction
        if (_controller.status == AnimationStatus.forward) {
          _controller.forward();
        } else if (_controller.status == AnimationStatus.reverse) {
          _controller.reverse();
        } else if (_controller.isDismissed) {
          _controller.forward();
        } else if (_controller.isCompleted) {
          _controller.reverse();
        }
      }
    });
  }

  void _toggleReverse() {
    if (!isPaused) {
      setState(() {
        isReversed = !isReversed;

        _updateAnimation();

        if (_controller.status == AnimationStatus.forward) {
          _controller.forward(from: 1.0 - _controller.value);
        } else if (_controller.status == AnimationStatus.reverse) {
          _controller.reverse(from: 1.0 - _controller.value);
        } else if (_controller.isDismissed) {
          _controller.forward();
        } else if (_controller.isCompleted) {
          _controller.reverse();
        }
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
      appBar: AppBar(title: Text('Growing Pac-Man')),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Growing Pac-Man\n\nAn explicit animation where Pac-Man scales up and down in a loop like when he eats a power-up and after he powers down.',
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
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    'images/pacman.png',
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