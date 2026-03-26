import 'package:depi/core/utils/functions/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomMealCardWidget extends StatefulWidget {
  const CustomMealCardWidget({
    super.key,
    required this.imagePath,
    required this.color,
    this.title,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.enableAnimation = false,
  });

  final AssetImage imagePath;
  final Color color;
  final String? title;
  final double width;
  final double height;
  final double borderRadius;
  final bool enableAnimation;

  @override
  State<CustomMealCardWidget> createState() => _CustomMealCardWidgetState();
}

class _CustomMealCardWidgetState extends State<CustomMealCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _bounceAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -12.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -12.0, end: 0.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -7.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -7.0, end: 0.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -3.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -3.0, end: 0.0), weight: 1),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));

    _startRepeatingBounce();
  }

  void _startRepeatingBounce() async {
    if (!widget.enableAnimation) return;
    while (mounted) {
      await Future.delayed(const Duration(seconds: 2));
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
    return Column(
      children: [
        AnimatedBuilder(
          animation: _bounceAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _bounceAnimation.value),
              child: child,
            );
          },
          child: InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kProductsView);
            },
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                color: widget.color,
                image: DecorationImage(
                  image: widget.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        if (widget.title != null) ...[
          SizedBox(height: 8),
          Text(
            widget.title!,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ],
    );
  }
}
