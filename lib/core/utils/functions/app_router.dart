import 'package:depi/features/account/views/account_view.dart';
import 'package:depi/features/favourites/views/favourites_view.dart';
import 'package:depi/features/login/views/login_view.dart';
import 'package:depi/features/login/controllers/login_cubit.dart';
import 'package:depi/features/products/views/products_view.dart';
import 'package:depi/features/register/views/register_view.dart';
import 'package:depi/features/register/controllers/register_cubit.dart';
import 'package:depi/views/animation_view.dart';
import 'package:depi/views/best_deals_view.dart';
import 'package:depi/views/delivery_view.dart';
import 'package:depi/features/home/views/home_view.dart';
import 'package:depi/views/my_orders_view.dart';
import 'package:depi/views/orders_view.dart';
import 'package:depi/features/product_details/views/product_details_view.dart';
import 'package:depi/views/shopping_cart_view.dart';
import 'package:depi/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/kHomeView';
  static const kProductDetailsView = '/product_details_view';
  static const kBestDealsView = '/best_deals_view';
  static const kDeliveryView = '/delivery_view';
  static const kShoppingCartView = '/shopping_cart_view';
  static const kOrdersView = '/orders_view';
  static const kAccountView = '/account_view';
  static const kFavouritesView = '/favourites_view';
  static const kAnimationView = '/animation_view';
  static const kMyOrdersView = '/my_orders_view';
  static const kProductsView = '/products_view';
  static const kLoginView = '/';
  static const kRegisterView = '/register_view';

  static final router = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) => Scaffold(
          body: child,
          bottomNavigationBar: const CustomBottomBar(),
          backgroundColor: Colors.white,
        ),
        routes: [
          GoRoute(
            path: kHomeView,
            builder: (context, state) => const HomeView(),
          ),
          GoRoute(
            path: kBestDealsView,
            builder: (context, state) => const BestDealsView(),
          ),
          GoRoute(
            path: kDeliveryView,
            builder: (context, state) => const DeliveryView(),
          ),
          GoRoute(
            path: kAccountView,
            builder: (context, state) => const AccountView(),
          ),
          GoRoute(
            path: kFavouritesView,
            builder: (context, state) => const FavouritesView(),
          ),
          GoRoute(
            path: kOrdersView,
            builder: (context, state) => const OrdersView(),
          ),

          GoRoute(
            path: kMyOrdersView,
            builder: (context, state) => const MyOrdersView(),
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
      GoRoute(
        path: kAnimationView,
        builder: (context, state) => const AnimationView(),
      ),
      GoRoute(
        path: kProductsView,
        builder: (context, state) => const ProductsView(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(),
          child: const RegisterView(),
        ),
      ),
    ],
  );
}
