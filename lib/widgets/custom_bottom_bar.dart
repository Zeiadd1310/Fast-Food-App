import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      barColor: Colors.white,
      controller: FloatingBottomBarController(initialIndex: 0),
      bottomBar: [
        BottomBarItem(
          icon: const Icon(FontAwesomeIcons.solidHouse),
          iconSelected: const Icon(
            FontAwesomeIcons.solidHouse,
            color: Color(0xffF55540),
          ),
          dotColor: Color(0xffF55540),
          onTap: (_) {},
        ),
        BottomBarItem(
          icon: const Icon(FontAwesomeIcons.heart),
          iconSelected: const Icon(
            FontAwesomeIcons.heart,
            color: Color(0xffF55540),
          ),
          dotColor: Color(0xffF55540),
          onTap: (_) {},
        ),
        BottomBarItem(
          icon: const Icon(Icons.shopping_bag_outlined),
          iconSelected: const Icon(
            Icons.shopping_bag_outlined,
            color: Color(0xffF55540),
          ),
          dotColor: Color(0xffF55540),
          onTap: (_) {},
        ),
        BottomBarItem(
          icon: const Icon(FontAwesomeIcons.user),
          iconSelected: const Icon(
            FontAwesomeIcons.user,
            color: Color(0xffF55540),
          ),
          dotColor: Color(0xffF55540),
          onTap: (_) {},
        ),
      ],
      bottomBarCenterModel: BottomBarCenterModel(
        centerIcon: FloatingCenterButton(
          child: Image.asset(
            'assets/images/shopping-cart.png',
            width: 24,
            height: 24,
          ),
        ),
        centerBackgroundColor: Color(0xffF55540),
        centerIconChild: const [],
      ),
    );
  }
}
