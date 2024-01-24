import 'package:airsmith_more_flutter_animations/expanding_circle.dart';
import 'package:airsmith_more_flutter_animations/page_slide.dart';
import 'package:airsmith_more_flutter_animations/progress_animator.dart';
import 'package:flutter/material.dart';

import 'animated_button.dart';
import 'delayed_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AnimatedButton();
                }));
              },
              child: const Text('Animated Button'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ExpandingCircle();
                }));
              },
              child: const Text('Expanding Circle'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const PageSlide();
                }));
              },
              child: const Text('Page Slide'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const DelayedListView();
                }));
              },
              child: const Text('Delayed List View'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ProgressAnimator();
                }));
              },
              child: const Text('Progress Animator'),
            ),
          ],
        ),
      ),
    );
  }
}
