import 'package:depi/views/home_view.dart';
import 'package:depi/views/product_details_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kProductDetailsView = '/product_details_view';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeView()),
      GoRoute(
        path: kProductDetailsView,
        builder: (context, state) => const ProductDetailsView(),
      ),
    ],
  );
}
