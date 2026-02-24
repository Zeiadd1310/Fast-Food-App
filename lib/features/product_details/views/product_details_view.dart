import 'package:depi/features/cart/controller/cart_controller.dart';
import 'package:depi/features/product_details/bloc/product_details_bloc.dart';
import 'package:depi/features/product_details/bloc/product_details_event.dart';
import 'package:depi/features/product_details/bloc/product_details_state.dart';
import 'package:depi/widgets/custom_adding_item_widget.dart';
import 'package:depi/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailsBloc(),
      child: const _ProductDetailsContent(),
    );
  }
}

class _ProductDetailsContent extends StatelessWidget {
  const _ProductDetailsContent();

  Widget _buildOptionRow({
    required BuildContext context,
    required String label,
    required double price,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xffF55540)
                        : const Color(0xffD9D9D9),
                    width: 1.w,
                  ),
                  color: isSelected
                      ? const Color(0xffF55540)
                      : Colors.transparent,
                ),
                child: isSelected
                    ? const Icon(Icons.check, color: Colors.white, size: 12)
                    : null,
              ),
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Text(
            '${price.toStringAsFixed(2)} ج.م',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          final bloc = context.read<ProductDetailsBloc>();
          final totalPrice = (state.totalPrice * cartController.itemCount)
              .toStringAsFixed(2);

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/chick.png',
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: 45.h,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => context.pop(),
                              child: const CustomBackButton(),
                            ),
                            Image.asset('assets/images/notification.png'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'معكرونه بالصوص و قطع بانية حار',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص.',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${state.basePrice.toStringAsFixed(2)} ج.م',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const CustomAddingItemWidget(),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Divider(
                        color: const Color(0xffD9D9D9).withOpacity(0.3),
                        thickness: 5,
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'الحجم',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60.w,
                            height: 30.h,
                            color: const Color(0xffFFE9D9),
                            child: Text(
                              'الزامي',
                              style: TextStyle(
                                color: const Color(0xffF55540),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      _buildOptionRow(
                        context: context,
                        label: 'سنجل',
                        price: 0.00,
                        isSelected: state.selectedSize == 'سنجل',
                        onTap: () => bloc.add(SelectSizeEvent('سنجل')),
                      ),
                      SizedBox(height: 16.h),
                      _buildOptionRow(
                        context: context,
                        label: 'دبل',
                        price: 100.0,
                        isSelected: state.selectedSize == 'دبل',
                        onTap: () => bloc.add(SelectSizeEvent('دبل')),
                      ),
                      SizedBox(height: 12.h),
                      Divider(
                        color: const Color(0xffD9D9D9).withOpacity(0.3),
                        thickness: 5,
                      ),
                      SizedBox(height: 12.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'الإضافات',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60.w,
                            height: 30.h,
                            color: const Color(0xffFFE9D9),
                            child: Text(
                              'اختياري',
                              style: TextStyle(
                                color: const Color(0xffF55540),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      _buildOptionRow(
                        context: context,
                        label: 'سلطة',
                        price: 50.0,
                        isSelected: state.selectedAddons.contains('سلطة'),
                        onTap: () => bloc.add(ToggleAddonEvent('سلطة', 50.0)),
                      ),
                      SizedBox(height: 16.h),
                      _buildOptionRow(
                        context: context,
                        label: 'حار',
                        price: 50.0,
                        isSelected: state.selectedAddons.contains('حار'),
                        onTap: () => bloc.add(ToggleAddonEvent('حار', 50.0)),
                      ),
                      SizedBox(height: 16.h),
                      _buildOptionRow(
                        context: context,
                        label: 'عادي',
                        price: 50.0,
                        isSelected: state.selectedAddons.contains('عادي'),
                        onTap: () => bloc.add(ToggleAddonEvent('عادي', 50.0)),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'النوع',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60.w,
                            height: 30.h,
                            color: Color(0xffFFE9D9),
                            child: Text(
                              'الزامي',
                              style: TextStyle(
                                color: Color(0xffF55540),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),

                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffF55540),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: const Color.fromARGB(
                                          255,
                                          255,
                                          172,
                                          161,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          cartController.itemCount.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    const Text(
                                      'إضافه إلي السله',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '$totalPrice ج.م',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
