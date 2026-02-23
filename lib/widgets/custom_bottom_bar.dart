import 'package:depi/core/utils/functions/app_router.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      barColor: Colors.white,
      controller: FloatingBottomBarController(initialIndex: _selectedIndex),
      bottomBar: [
        BottomBarItem(
          icon: const Icon(FontAwesomeIcons.solidHouse),
          iconSelected: const Icon(
            FontAwesomeIcons.solidHouse,
            color: Color(0xffF55540),
          ),
          dotColor: const Color(0xffF55540),
          onTap: (_) {
            setState(() => _selectedIndex = 0);
            context.go('/');
          },
        ),
        BottomBarItem(
          icon: const Icon(FontAwesomeIcons.heart),
          iconSelected: const Icon(
            FontAwesomeIcons.heart,
            color: Color(0xffF55540),
          ),
          dotColor: const Color(0xffF55540),
          onTap: (_) {
            setState(() => _selectedIndex = 1);
            GoRouter.of(context).push(AppRouter.kBestDealsView);
          },
        ),
        BottomBarItem(
          icon: Image.asset('assets/images/bag-happy.png'),
          iconSelected: Image.asset('assets/images/bag-happy-o.png'),
          dotColor: const Color(0xffF55540),
          onTap: (_) {
            setState(() => _selectedIndex = 2);
            GoRouter.of(context).push(AppRouter.kShoppingCartView);
          },
        ),
        BottomBarItem(
          icon: const Icon(FontAwesomeIcons.user),
          iconSelected: const Icon(
            FontAwesomeIcons.user,
            color: Color(0xffF55540),
          ),
          dotColor: const Color(0xffF55540),
          onTap: (_) {
            setState(() => _selectedIndex = 3);
            GoRouter.of(context).push(AppRouter.kDeliveryView);
          },
        ),
      ],
      bottomBarCenterModel: BottomBarCenterModel(
        centerIcon: FloatingCenterButton(
          child: GestureDetector(
            onTap: () => GoRouter.of(context).push(AppRouter.kDeliveryView),
            child: Image.asset(
              'assets/images/shopping-cart.png',
              width: 24,
              height: 24,
            ),
          ),
        ),
        centerBackgroundColor: const Color(0xffF55540),
        centerIconChild: const [],
      ),
    );
  }
}
