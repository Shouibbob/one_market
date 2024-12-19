import 'package:one_market/core/utils/colors.dart';
import 'package:one_market/core/utils/text_style.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Buttons extends StatelessWidget {
  String text;
  final void Function() onPressed;
   Buttons({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: getBodyStyle(
            color: AppColors.secondryColor,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}