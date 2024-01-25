import 'dart:async';

import 'package:flutter/material.dart';

class PageTransition extends StatefulWidget {
  const PageTransition({super.key});

  @override
  State<PageTransition> createState() => _PageTransitionState();
}

class _PageTransitionState extends State<PageTransition>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _controller.addListener(() {
      if (_controller.isCompleted) {
        CustomPageTransition(route: const NextPage());
      }
      Timer(const Duration(seconds: 5), () {
        _controller.reset();
      });
    });
    _animation = Tween<double>(begin: 1, end: 100).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            _controller.forward();
          },
          child: ScaleTransition(
            scale: _animation,
            child: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blue,
      body: const Center(
        child: Text(
          'Hello World',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}

class CustomPageTransition extends PageRouteBuilder {
  final Widget route;
  CustomPageTransition({required this.route})
      : super(pageBuilder: (context, animation, animation2) {
          return route;
        }, transitionsBuilder: (context, animation, animation2, child) {
          final position =
              Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                  .animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeIn,
            ),
          );
          return SlideTransition(position: position);
        });
}
