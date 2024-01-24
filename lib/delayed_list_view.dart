import 'package:flutter/material.dart';

class DelayedListView extends StatefulWidget {
  const DelayedListView({super.key});

  @override
  State<DelayedListView> createState() => _DelayedListViewState();
}

class _DelayedListViewState extends State<DelayedListView>
    with SingleTickerProviderStateMixin {
  late List<Animation<Offset>> _animation;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = List.generate(
      10,
      (index) => Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(index * 0.1, 1),
        ),
      ),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: ((context, index) {
              return SlideTransition(
                position: _animation[index],
                child: ListTile(
                  leading: Text('$index'),
                  title: Text('Item ${index + 1}'),
                ),
              );
            })));
  }
}
