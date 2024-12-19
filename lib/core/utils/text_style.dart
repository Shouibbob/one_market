import 'package:flutter/material.dart';
import 'package:one_market/core/utils/colors.dart';

TextStyle getHeadLineStyle({
  double fontSize = 24,
  Color? color,
  fontWeight = FontWeight.bold,
  String? fontFamily}){
    return TextStyle(
      fontFamily: fontFamily ?? 'rubik',
      color: color ?? AppColors.secondryColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  TextStyle getTitleStyle({
  double fontSize = 18,
  Color? color,
  fontWeight = FontWeight.bold,
  String? fontFamily}){
    return TextStyle(
      fontFamily: fontFamily ?? 'rubik',
      color: color ?? AppColors.secondryColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  TextStyle getBodyStyle({
  double fontSize = 16,
  Color? color,
  fontWeight = FontWeight.bold,
  String? fontFamily}){
    return TextStyle(
      fontFamily: fontFamily ?? 'rubik',
      color: color ?? AppColors.primaryColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
  TextStyle getSmallStyle({
  double fontSize = 14,
  Color? color,
  fontWeight = FontWeight.bold,
  String? fontFamily}){
    return TextStyle(
      fontFamily: fontFamily ?? 'rubik',
      color: color ?? AppColors.secondryColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }