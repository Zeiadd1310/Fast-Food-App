import 'package:flutter/material.dart';

class AnimationView extends StatefulWidget {
  const AnimationView({super.key});

  @override
  State<AnimationView> createState() => _AnimationViewState();
}

class _AnimationViewState extends State<AnimationView> {
  bool _isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              width: _isAnimated ? 150 : 100,
              height: _isAnimated ? 150 : 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(_isAnimated ? 75 : 0),
              ),
              transform: Matrix4.translationValues(
                0,
                _isAnimated ? -250 : 0,
                0,
              ),
            ),
          ),
          SizedBox(height: 150),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isAnimated = !_isAnimated;
              });
            },
            child: const Text('Start Animation'),
          ),
        ],
      ),
    );
  }
}
