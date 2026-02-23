import 'package:depi/views/best_deals_view.dart';
import 'package:depi/views/delivery_view.dart';
import 'package:depi/views/home_view.dart';
import 'package:depi/views/product_details_view.dart';
import 'package:depi/views/shopping_cart_view.dart';
import 'package:depi/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/';
  static const kProductDetailsView = '/product_details_view';
  static const kBestDealsView = '/best_deals_view';
  static const kDeliveryView = '/delivery_view';
  static const kShoppingCartView = '/shopping_cart_view';

  static final router = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) => Scaffold(
          body: child,
          bottomNavigationBar: const CustomBottomBar(),
          backgroundColor: Colors.white,
        ),
        routes: [
          GoRoute(path: '/', builder: (context, state) => const HomeView()),
          GoRoute(
            path: kBestDealsView,
            builder: (context, state) => const BestDealsView(),
          ),
          GoRoute(
            path: kDeliveryView,
            builder: (context, state) => const DeliveryView(),
          ),
        ],
      ),
      GoRoute(
        path: kProductDetailsView,
        builder: (context, state) => const ProductDetailsView(),
      ),
      GoRoute(
        path: kShoppingCartView,
        builder: (context, state) => const ShoppingCartView(),
      ),
    ],
  );
}
