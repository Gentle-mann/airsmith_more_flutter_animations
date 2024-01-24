import 'package:flutter/material.dart';

class ExpandingCircle extends StatefulWidget {
  const ExpandingCircle({super.key});

  @override
  State<ExpandingCircle> createState() => _ExpandingCircleState();
}

class _ExpandingCircleState extends State<ExpandingCircle>
    with TickerProviderStateMixin {
  late AnimationController _avatarController;
  late AnimationController _radiusController;
  late Animation _animation;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _avatarController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _radiusController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(
      begin: 20,
      end: MediaQuery.of(context).size.width * 0.3,
    ).animate(_avatarController);
    _avatarController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CircleAvatar(
                backgroundColor: Colors.blue,
                radius: _animation.value,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.9),
                        spreadRadius: 50,
                        offset: const Offset(1, -1),
                        blurRadius: 100,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
