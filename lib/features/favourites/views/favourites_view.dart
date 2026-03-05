import 'package:depi/features/favourites/controller/favourites_controller.dart';
import 'package:depi/features/favourites/views/widgets/custom_favourite_meal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
              Expanded(
                child: Consumer<FavouritesController>(
                  builder: (context, favouritesController, _) {
                    if (favouritesController.favouritesList.isEmpty) {
                      return Center(
                        child: Text(
                          'لا توجد عناصر مفضلة',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xff868686),
                          ),
                        ),
                      );
                    }
                    return ListView.separated(
                      itemCount: favouritesController.favouritesList.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16.h),
                      itemBuilder: (context, index) {
                        return CustomFavouriteMealWidget(
                          product: favouritesController.favouritesList[index],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
