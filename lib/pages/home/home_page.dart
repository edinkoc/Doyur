import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/auth/sign_up_page.dart';
import 'package:myapp/pages/cart/cart_history.dart';
import 'package:myapp/pages/home/main_tech_page.dart';
import 'package:myapp/pages/profile/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../about_us/about_us.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  late PersistentTabController _controller;


  List pages = [
    const MainFoodPage(),
    AboutUsPage(),
    CartHistory(),
    ProfilePage(),
  ];

  void onTapNav(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState(){
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  /*@override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF0C2F60),
        unselectedItemColor: Color(0xFF91989D),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled,),
              label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye_rounded,),
            label: "Seen",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_rounded,),
            label: "Basket",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,),
            label: "Account",
          ),
        ],
      ),
    );
  }*/

  List<Widget> _buildScreens() {
    return [
      MainFoodPage(),
      AboutUsPage(),
      CartHistory(),
      ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_filled,),
        title: ("Home"),
        activeColorPrimary: Color(0xFF0C2F60),
        inactiveColorPrimary: Color(0xFF91989D),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.remove_red_eye_rounded,),
        title: ("Seen"),
        activeColorPrimary: Color(0xFF0C2F60),
        inactiveColorPrimary: Color(0xFF91989D),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_basket_rounded,),
        title: ("Basket"),
        activeColorPrimary: Color(0xFF0C2F60),
        inactiveColorPrimary: Color(0xFF91989D),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person_circle_fill),
        title: ("Account"),
        activeColorPrimary: const Color(0xFF0C2F60),
        inactiveColorPrimary: const Color(0xFF91989D),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
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
}
