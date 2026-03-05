import 'package:depi/core/utils/functions/app_router.dart';
import 'package:depi/features/home/home_cubit/home_cubit.dart';
import 'package:depi/widgets/custom_meal_card_widget.dart';
import 'package:depi/widgets/custom_meal_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/avatar.png'),
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/navigation.png'),
                        Text(
                          'الموقع الحالي',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      '19 الشيخ احمد الصاوي، مدينة نصر',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff515151),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 8),
                Image.asset('assets/images/notification.png'),
              ],
            ),
          ),
          body: (state is HomeLoading)
              ? Center(child: LottieBuilder.asset('assets/images/loading.json'))
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'تبحث عن وجبة معينه ؟',
                            hintStyle: TextStyle(
                              color: Color(0xffFCCAC4),
                              fontSize: 16,
                            ),
                            prefixIcon: Icon(
                              FontAwesomeIcons.magnifyingGlass,
                              color: Color(0xffF55540),
                              size: 25,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Color(0xffF55540)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Color(0xffF55540)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Color(0xffF55540)),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomMealCardWidget(
                              imagePath: AssetImage('assets/images/burger.png'),
                              color: Color(0xffF55540),
                              title: 'وجبات سريعة',
                              width: 85,
                              height: 85,
                              borderRadius: 16,
                            ),
                            CustomMealCardWidget(
                              imagePath: AssetImage(
                                'assets/images/chicken.png',
                              ),
                              color: Color(0xffFCCAC4),
                              title: 'مشويات',
                              width: 85,
                              height: 85,
                              borderRadius: 16,
                            ),
                            CustomMealCardWidget(
                              imagePath: AssetImage(
                                'assets/images/seafood.png',
                              ),
                              color: Color(0xff00A991),
                              title: 'مأكولات بحرية',
                              width: 85,
                              height: 85,
                              borderRadius: 16,
                            ),
                            CustomMealCardWidget(
                              imagePath: AssetImage('assets/images/meat.png'),
                              color: Color(0xffB0E4DD),
                              title: 'لحوم',
                              width: 85,
                              height: 85,
                              borderRadius: 16,
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Image.asset(
                          'assets/images/sale.png',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: 24),
                        Text(
                          '🔥 الافضل خلال اليوم',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 16),
                        if (context.read<HomeCubit>().productsList.isNotEmpty)
                          Wrap(
                            spacing: 28,
                            runSpacing: 16,
                            children: [
                              for (var product
                                  in context.read<HomeCubit>().productsList)
                                SizedBox(
                                  width:
                                      (MediaQuery.of(context).size.width - 64) /
                                      2,
                                  child: GestureDetector(
                                    onTap: () {
                                      GoRouter.of(
                                        context,
                                      ).push(AppRouter.kProductDetailsView);
                                    },
                                    child: CustomMealInfoWidget(
                                      product: product,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
