import 'package:depi/features/products/products_cubit/products_cubit.dart';
import 'package:depi/features/products/widgets/menu_item_card.dart';
import 'package:depi/widgets/my_location_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              MyLocationWidget(),
              SizedBox(height: 20.h),
              Expanded(
                child: BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    if (state is ProductsLoading) {
                      return Center(
                        child: LottieBuilder.asset(
                          'assets/images/loading.json',
                        ),
                      );
                    }
                    if (state is ProductsFailure) {
                      return Center(child: Text(state.errorMessage));
                    }
                    if (state is ProductsSuccess) {
                      return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) =>
                            MenuItemCard(product: state.products[index]),
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(
                              height: 30.h,
                              thickness: 1,
                              color: Color(0xFFe4e4e4),
                            ),
                        itemCount: state.products.length,
                      );
                    }
                    return const SizedBox();
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
