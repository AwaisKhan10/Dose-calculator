import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  final iconColor;

  CustomBackButton({
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return

        ///
        /// BackButton
        ///
        GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Icon(
        Icons.arrow_back_ios_new_sharp,
        size: 22,
        color: iconColor,
      ),
    );
  }
}
