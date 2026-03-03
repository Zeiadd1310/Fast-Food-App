import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
          child: Column(
            children: [
              SizedBox(height: 15.h),
              Center(
                child: Text(
                  'حسابي',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Container(
                width: 140.w,
                height: 140.h,
                decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  border: Border.all(color: const Color(0xffE8E8E8)),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.r),
                      child: Image.asset(
                        'assets/images/person.png',
                        width: 140.w,
                        height: 140.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8.h,
                      right: 8.w,
                      child: Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              CustomRowProfileWidget(
                text: 'تعديل حسابي',
                imagePath: 'assets/images/frame.png',
              ),
              SizedBox(height: 25.h),
              CustomRowProfileWidget(
                text: 'دعوة صديق',
                imagePath: 'assets/images/profile-2user.png',
              ),
              SizedBox(height: 25.h),
              CustomRowProfileWidget(
                text: 'عن التطبيق و الجوائز',
                imagePath: 'assets/images/clipboard-tick.png',
              ),
              SizedBox(height: 25.h),
              CustomRowProfileWidget(
                text: 'شروط الاستخدام',
                imagePath: 'assets/images/task.png',
              ),
              SizedBox(height: 25.h),
              CustomRowProfileWidget(
                text: 'حذف حساب',
                imagePath: 'assets/images/profile-delete.png',
              ),
              SizedBox(height: 25.h),
              CustomRowProfileWidget(
                text: 'تسجيل الخروج',
                imagePath: 'assets/images/logout.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRowProfileWidget extends StatelessWidget {
  const CustomRowProfileWidget({
    super.key,
    required this.text,
    required this.imagePath,
  });

  final String text;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imagePath, width: 30.w, height: 30.h),
        SizedBox(width: 5.w),
        Text(
          text,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
