import 'package:flutter/material.dart';

Widget CustomHorizontalContainerWidget(String label) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Color(0xffE6E6E6)),
    ),
    child: Text(
      label,
      style: const TextStyle(fontSize: 14, color: Color(0xff6D6D6D)),
    ),
  );
}
