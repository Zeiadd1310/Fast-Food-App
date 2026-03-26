import 'package:flutter/material.dart';

class MyLocationWidget extends StatefulWidget {
  const MyLocationWidget({super.key});

  @override
  State<MyLocationWidget> createState() => _MyLocationWidgetState();
}

class _MyLocationWidgetState extends State<MyLocationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _wiggleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _wiggleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -0.4), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -0.4, end: 0.4), weight: 3),
      TweenSequenceItem(tween: Tween(begin: 0.4, end: -0.4), weight: 3),
      TweenSequenceItem(tween: Tween(begin: -0.4, end: 0.4), weight: 3),
      TweenSequenceItem(tween: Tween(begin: 0.4, end: -0.1), weight: 3),
      TweenSequenceItem(tween: Tween(begin: -0.1, end: 0.0), weight: 1),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _startRepeatingWiggle();
  }

  void _startRepeatingWiggle() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        _controller.forward(from: 0.0);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/avatar.png'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset('assets/images/navigation.png'),
                Text(
                  'الموقع الحالي',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ],
            ),
            Text(
              '19 الشيخ احمد الصاوي، مدينة نصر',
              style: TextStyle(fontSize: 15, color: Color(0xff515151)),
            ),
          ],
        ),
        AnimatedBuilder(
          animation: _wiggleAnimation,
          builder: (context, child) {
            return Transform.rotate(
              angle: _wiggleAnimation.value,
              child: child,
            );
          },
          child: Image.asset(
            'assets/images/notification.png',
            height: 40,
            width: 40,
          ),
        ),
      ],
    );
  }
}
