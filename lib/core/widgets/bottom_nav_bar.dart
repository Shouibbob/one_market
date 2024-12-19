import 'package:flutter/material.dart';
import 'package:one_market/core/utils/colors.dart';
import 'package:one_market/feature/home/pages/account.dart';
import 'package:one_market/feature/cart/presentation/pages/cart.dart';
import 'package:one_market/feature/home/pages/food.dart';
import 'package:one_market/feature/home/pages/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  const BottomNavBar({super.key, required this.initialIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    switch (index) {
      case 0:
        navigateToRoute(context, '/home', const HomeScreen());
        break;
      case 1:
        navigateToRoute(context, '/food', const Food());
        break;
      case 2:
        navigateToRoute(context, '/account', const Account());
        break;
      case 3:
        navigateToRoute(context, '/cart', const Cart());
        break;
    }
  }

  void navigateToRoute(context, String routeName, Widget screen) {
    final String? currentRouteName = ModalRoute.of(context)?.settings.name;
    bool routeExists = currentRouteName == routeName;

    if (routeExists) {
      Navigator.popUntil(
        context,
        ModalRoute.withName(routeName),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
          settings: RouteSettings(name: routeName),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: onItemTapped,
      backgroundColor: AppColors.primaryColor,
      selectedItemColor: AppColors.foreGround,
      unselectedItemColor: AppColors.secondryColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
            color: selectedIndex == 0
                ? AppColors.foreGround
                : AppColors.secondryColor,
          ),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.food_bank_outlined,
            color: selectedIndex == 1
                ? AppColors.foreGround
                : AppColors.secondryColor,
          ),
          label: 'الطعام',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_2_outlined,
            color: selectedIndex == 2
                ? AppColors.foreGround
                : AppColors.secondryColor,
          ),
          label: 'الحساب',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: selectedIndex == 3
                ? AppColors.foreGround
                : AppColors.secondryColor,
          ),
          label: 'السلة',
        ),
      ],
    );
  }
}
