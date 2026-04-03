import 'package:depi/core/utils/functions/api_service.dart';
import 'package:depi/core/utils/functions/app_router.dart';
import 'package:depi/features/cart/controller/cart_controller.dart';
import 'package:depi/features/favourites/controller/favourites_controller.dart';
import 'package:depi/features/home/home_cubit/home_cubit.dart';
import 'package:depi/features/products/products_cubit/products_cubit.dart';
import 'package:depi/features/products/repos/products_repo_impl.dart';
import 'package:depi/firebase_options.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..loadProducts()),
        BlocProvider(
          create: (context) =>
              ProductsCubit(ProductsRepoImpl(ApiService(Dio())))
                ..fetchProducts(),
        ),
        ChangeNotifierProvider(create: (context) => CartController()),
        ChangeNotifierProvider(create: (context) => FavouritesController()),
      ],
      child: const FastFoodApp(),
    ),
  );
}

class FastFoodApp extends StatelessWidget {
  const FastFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
        supportedLocales: const [Locale('ar')],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(textTheme: GoogleFonts.notoKufiArabicTextTheme()),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
