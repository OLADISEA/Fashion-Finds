
import 'package:fashion_finds/src/ui/screen/fashion_page/fashion_page.dart';
import 'package:fashion_finds/src/ui/screen/notifications_page/notifications_page.dart';
import 'package:fashion_finds/src/ui/screen/orders_page/order_page.dart';
import 'package:fashion_finds/src/ui/screen/settings_page/settings.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../common/app_colors/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late PersistentTabController _controller;
  late bool _hideNavBar;


  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Container(),
        ],
      ),
      bottomNavigationBar: PersistentTabView(
        context,
        controller: _controller,
        screens: [
          FashionPage(),
          //Container(color: Colors.red), // Home Screen
          NotificationsPage(),
          OrderPage(),
          SettingsPage(),
        ],
        items: [
          PersistentBottomNavBarItem(
              icon: const Icon(Icons.home),
              //title: 'Home',
              activeColorPrimary: AppColor.splashScreenColor,
              inactiveColorPrimary: AppColor.blackColor
          ),
          PersistentBottomNavBarItem(
              icon: const Icon(Icons.event_note_sharp),
              //title: 'Details',
              activeColorPrimary: AppColor.splashScreenColor,
              inactiveColorPrimary: AppColor.blackShade
          ),
          PersistentBottomNavBarItem(
              icon: const Icon(Icons.video_library),
              //title: 'Videos',
              activeColorPrimary: AppColor.splashScreenColor,
              inactiveColorPrimary: AppColor.blackShade
          ),
          PersistentBottomNavBarItem(
              icon: const Icon(Icons.settings),
              //title: 'Settings',
              activeColorPrimary:AppColor.splashScreenColor,
              inactiveColorPrimary: AppColor.blackColor
          ),
        ],
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBar: _hideNavBar, // Pass the _hideNavBar value here
        hideNavigationBarWhenKeyboardShows: true,
        margin: const EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style3,
      ),
    );
  }
}
