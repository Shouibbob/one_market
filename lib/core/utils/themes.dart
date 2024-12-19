import 'package:flutter/material.dart';
import 'package:one_market/core/utils/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'rubik',
    scaffoldBackgroundColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.secondryColor,
      foregroundColor: AppColors.primaryColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontFamily: 'rubik',
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
    ),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: AppColors.primaryColor,
    //   elevation: 0,
    //   type: BottomNavigationBarType.fixed,
    //   showSelectedLabels: false,
    //   showUnselectedLabels: false,
    //   selectedItemColor: AppColors.secondryColor,
    //   unselectedItemColor: AppColors.primaryColor,
    // ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.secondryColor,
    ),
    // inputDecorationTheme: const InputDecorationTheme(
    //   hintStyle: TextStyle(
    //     fontFamily: 'rubik',
    //     color: AppColors.secondryColor,
    //     fontSize: 15,
    //     fontWeight: FontWeight.w400,
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(8)),
    //     borderSide: BorderSide(
    //       color: AppColors.primaryColor,
    //       width: 1,
    //     ),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(8)),
    //     borderSide: BorderSide(
    //       color: AppColors.secondryColor,
    //       width: 1,
    //     ),
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(8)),
    //     borderSide: BorderSide(
    //       color: AppColors.redColor,
    //       width: 1,
    //     ),
    //   ),
    //   focusedErrorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(8)),
    //     borderSide: BorderSide(
    //       color: AppColors.redColor,
    //       width: 1,
    //     ),
    //   ),
    //   filled: true,
    //   fillColor: AppColors.primaryColor,
    // ),
  );
}
