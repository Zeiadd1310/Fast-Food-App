import 'package:depi/features/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomAddingItemWidget extends StatelessWidget {
  const CustomAddingItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, child) {
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
                onTap: () {
                  cartController.removeItem();
                },
                child: Icon(
                  Icons.remove,
                  color: Color(0xffFFD2B0),
                  size: 24.sp,
                ),
              ),
              Text(
                cartController.itemCount.toString(),
                style: TextStyle(fontSize: 16.sp),
              ),
              InkWell(
                onTap: () {
                  cartController.addItem();
                },
                child: Icon(Icons.add, color: Color(0xffF55540), size: 24.sp),
              ),
            ],
          ),
        );
      },
    );
  }
}
