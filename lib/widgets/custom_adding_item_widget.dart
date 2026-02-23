import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddingItemWidget extends StatelessWidget {
  const CustomAddingItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 35.h,
      decoration: BoxDecoration(
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Icon(Icons.remove, color: Color(0xffFFD2B0), size: 24.sp),
          ),
          Text('1', style: TextStyle(fontSize: 16.sp)),
          InkWell(
            child: Icon(Icons.add, color: Color(0xffF55540), size: 24.sp),
          ),
        ],
      ),
    );
  }
}
