import 'package:flutter/material.dart';

class RotatingBall extends StatefulWidget {
  const RotatingBall({super.key});

  @override
  State<RotatingBall> createState() => _RotatingBallState();
}

class _RotatingBallState extends State<RotatingBall>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 600),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animationController.value * 2 * 3.1415,
          child: Image.asset(
            'assets/images/pokemon-ball.png',
            width: 300,
            height: 300,
          ),
        );
      },
    );
  }
}
