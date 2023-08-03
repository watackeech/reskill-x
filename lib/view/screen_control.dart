import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:reskill_x/view/goal_screen.dart';
import 'package:reskill_x/view/point_screen.dart';

import '../constant/colors.dart';
import 'home_screen.dart';

class ScreenControl extends StatelessWidget {
  const ScreenControl({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 1);

    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const GoalScreen(),
    const HomeScreen(),
    const PointScreen(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.flag_sharp),
      title: ("目標"),
      activeColorPrimary: kPrime,
      inactiveColorPrimary: kLightGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home_filled),
      title: ("ホーム"),
      activeColorPrimary: kPrime,
      inactiveColorPrimary: kLightGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.wallet_giftcard),
      title: ("ポイント交換"),
      activeColorPrimary: kPrime,
      inactiveColorPrimary: kLightGrey,
    ),
  ];
}
