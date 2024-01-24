import 'package:flutter/material.dart';

import 'animated_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                showGeneralDialog(
                    context: context,
                    pageBuilder: ((context, animation, secondaryAnimation) {
                      return AboutDialog(
                        children: [
                          GestureDetector(
                            child: Container(),
                          ),
                        ],
                      );
                    }));
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AnimatedButton();
                }));
              },
              child: const Text('Animated Button'),
            ),
          ],
        ),
      ),
    );
  }
}
