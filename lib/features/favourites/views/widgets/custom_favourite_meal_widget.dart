import 'package:depi/constants.dart';
import 'package:depi/features/home/models/product_model.dart';
import 'package:depi/features/favourites/controller/favourites_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomFavouriteMealWidget extends StatelessWidget {
  final Products product;

  const CustomFavouriteMealWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  product.image ?? 'assets/images/food.png',
                  width: 80.w,
                  height: 65.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name ?? 'اسم الوجبة',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            product.category ?? 'الفئة',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffA5A5A5),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Text(
                                '${product.price ?? 0} ج.م',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Icon(Icons.star, color: kPrimaryColor, size: 20),
                              SizedBox(width: 2.w),
                              Text(
                                '${product.rating ?? 0.0}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff939393),
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                '(${product.ratingsCount ?? 0})',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff939393),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer<FavouritesController>(
                            builder: (context, favouritesController, _) {
                              return GestureDetector(
                                onTap: () {
                                  favouritesController.removeFromFavourites(
                                    product.id ?? 0,
                                  );
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: kPrimaryColor,
                                  size: 25,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 15.h),
                          Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 3,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Image.asset(
                              'assets/images/add.png',
                              width: 20.w,
                              height: 20.h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
