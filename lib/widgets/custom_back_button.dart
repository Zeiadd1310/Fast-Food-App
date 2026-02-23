import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Container(
        width: 35.w,
        height: 35.h,
        decoration: BoxDecoration(
          color: const Color(0xffF55540),
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: const Padding(
          padding: EdgeInsets.only(right: 4.0),
          child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}
