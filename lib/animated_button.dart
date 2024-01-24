import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({super.key});

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              print('yo');
              isTap = !isTap;
            });
          },
          child: AnimatedContainer(
            width: isTap ? 60 : 150,
            height: 70,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(seconds: 1),
            decoration: BoxDecoration(
              color: isTap ? Colors.blue : Colors.green,
              borderRadius: BorderRadius.circular(isTap ? 10 : 30),
            ),
            child: isTap
                ? const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  )
                : const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Added to cart'),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
