import 'package:flutter/material.dart';

class CustomTextMealWidget extends StatelessWidget {
  const CustomTextMealWidget({super.key, required this.imagePath});

  final AssetImage imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath.assetName,
          width: 180,
          height: 150,
          fit: BoxFit.fill,
        ),
        SizedBox(height: 10),
        Text(
          'معكرونه بالصوص و قطع بانية حار',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 10),
        Text(
          '2.20 د.ك',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: Color(0xff868686),
          ),
        ),
      ],
    );
  }
}
