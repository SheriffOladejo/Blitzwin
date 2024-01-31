import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../utilities/hex_color.dart';
import '../utilities/utils.dart';
import 'menu.dart';
import 'casino.dart';
import 'chats.dart';
import 'explore.dart';
import 'home_screen.dart';
import 'settings.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final utils = Utils();
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: screens,
      items: nav_bar_items(),
      confineInSafeArea: true,
      backgroundColor: Colors.black,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }

  List<PersistentBottomNavBarItem> nav_bar_items() {
    return [
      PersistentBottomNavBarItem(
        icon: Container(
          width: 25,
          height: 25,
          alignment: Alignment.center,
          child: const ImageIcon(
            AssetImage("assets/images/menu.png"),
          ),
        ),
        title: ("Menu"),
        activeColorPrimary: HexColor("#FC5EC7B2"),
        inactiveColorPrimary: HexColor("#BEC1C4"),
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          width: 25,
          height: 25,
          alignment: Alignment.center,
          child: const ImageIcon(
            AssetImage("assets/images/home.png"),
          ),
        ),
        title: ("Home"),
        activeColorPrimary: HexColor("#FC5EC7B2"),
        inactiveColorPrimary: HexColor("#FFFFFF"),
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          width: 25,
          height: 25,
          alignment: Alignment.center,
          child: const ImageIcon(
            AssetImage("assets/images/gem.png"),
          ),
        ),
        title: ("Casino"),
        activeColorPrimary: HexColor("#FC5EC7B2"),
        inactiveColorPrimary: HexColor("#FFFFFF"),
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          width: 25,
          height: 25,
          alignment: Alignment.center,
          child: const ImageIcon(
            AssetImage("assets/images/explore.png"),
          ),
        ),
        title: ("Explore"),
        activeColorPrimary: HexColor("#FC5EC7B2"),
        inactiveColorPrimary: HexColor("#BEC1C4"),
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          width: 25,
          height: 25,
          alignment: Alignment.center,
          child: const ImageIcon(
            AssetImage("assets/images/chats.png"),
          ),
        ),
        title: ("Chats"),
        activeColorPrimary: HexColor("#FC5EC7B2"),
        inactiveColorPrimary: HexColor("#BEC1C4"),
      ),
    ];
  }

  void onItemClicked(int index) {
    controller.jumpToTab(index);
  }

  List<Widget> get screens => [
    const MenuScreen(),
    HomeScreen(callback: onItemClicked),
    const CasinoScreen(),
    const ChatsScreen(),
    const SettingsScreen(),
  ];
}
