import 'package:depi/features/favourites/views/widgets/custom_favourite_meal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            children: [
              SizedBox(height: 15.h),
              Center(
                child: Text(
                  'المفضلة',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              CustomFavouriteMealWidget(),
              SizedBox(height: 12.h),
              CustomFavouriteMealWidget(),
              SizedBox(height: 12.h),
              CustomFavouriteMealWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
