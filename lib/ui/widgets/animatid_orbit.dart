import 'dart:math';

import 'package:flutter/cupertino.dart';

class AnimatedOrbit extends StatefulWidget {
  final double radius;  // Distance from the center
  final double angle;   // Initial angle in radians
  final String imagePath;
  final String label;

  const AnimatedOrbit({
    Key? key,
    required this.radius,
    required this.angle,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  @override
  _AnimatedOrbitState createState() => _AnimatedOrbitState();
}

class _AnimatedOrbitState extends State<AnimatedOrbit>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 5), // Duration for one full rotation
      vsync: this,
    );

    _animation = Tween<double>(
      begin: widget.angle,
      end: widget.angle + 2 * 3.141592653589793, // One full circle
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Smooth start and stop
    ));

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        double x = widget.radius * (1.5 + cos(_animation.value));
        double y = widget.radius * (1.5 + sin(_animation.value));

        return Positioned(
          left: x,
          top: y,
          child: Column(
            children: [
              Image.asset(widget.imagePath, width: 50, height: 50),
              Text(widget.label, style: TextStyle(fontSize: 16)),
            ],
          ),
        );
      },
    );
  }
}
