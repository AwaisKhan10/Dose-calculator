// ignore_for_file: must_be_immutable

import 'package:dose_calculator/core/contants/color.dart';
import 'package:dose_calculator/core/contants/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String name;
  Color color;
  final onTap;

  CustomButton({
    Key? key,
    required this.onTap,
    required this.name,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15.0),
        // height: 48.h,
        // width: 334.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Center(
          child: Text(
            '${name}',
            style: kHeadingParagraph2.copyWith(color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
