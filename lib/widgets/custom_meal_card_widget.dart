import 'package:flutter/material.dart';

class CustomMealCardWidget extends StatelessWidget {
  const CustomMealCardWidget({
    super.key,
    required this.imagePath,
    required this.color,
    this.title,
    required this.width,
    required this.height,
    required this.borderRadius,
  });

  final AssetImage imagePath;
  final Color color;
  final String? title;
  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: color,
            image: DecorationImage(image: imagePath, fit: BoxFit.contain),
          ),
        ),
        if (title != null) ...[
          SizedBox(height: 8),
          Text(
            title!,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ],
    );
  }
}
