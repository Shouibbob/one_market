import 'package:flutter/material.dart';
import 'package:one_market/core/utils/colors.dart';
import 'package:one_market/core/utils/text_style.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  final Icon icon;
  final String label;
  TextEditingController controller;
  bool secureText;
  String? Function(String?)? validator;
  Widget? suffixIcon;

  TextFormFieldWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.controller,
    this.secureText = false,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: secureText,
        style: getBodyStyle(
          color: AppColors.secondryColor,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          prefixIcon: icon,
          suffixIcon: suffixIcon,
          labelStyle: getSmallStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
