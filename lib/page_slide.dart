import 'package:airsmith_more_flutter_animations/delayed_list_view.dart';
import 'package:flutter/material.dart';

class PageSlide extends StatefulWidget {
  const PageSlide({super.key});

  @override
  State<PageSlide> createState() => _PageSlideState();
}

class _PageSlideState extends State<PageSlide>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animation;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<Offset>(
      begin: const Offset(-1, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.slowMiddle,
      ),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(seconds: 5),
                  builder: (context, opacity, child) {
                    return Opacity(
                      opacity: opacity,
                      child: const CircleAvatar(
                        radius: 100,
                        child: Icon(
                          Icons.person,
                          size: 90,
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              SlideTransition(
                position: _animation,
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const DelayedListView();
                        }));
                      },
                      child: const Text(
                        'Register your account',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
