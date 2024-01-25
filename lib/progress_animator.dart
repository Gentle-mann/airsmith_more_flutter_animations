import 'package:flutter/material.dart';

class ProgressAnimator extends StatefulWidget {
  const ProgressAnimator({super.key});

  @override
  State<ProgressAnimator> createState() => _ProgressAnimatorState();
}

class _ProgressAnimatorState extends State<ProgressAnimator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 0.8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return SizedBox(
                  height: 200,
                  width: 200,
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: _animation.value,
                        strokeWidth: 10,
                        color: Colors.red,
                        backgroundColor: Colors.blue,
                      ),
                      Center(
                        child: Text(
                          '${(_animation.value * 100).round()}%',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
