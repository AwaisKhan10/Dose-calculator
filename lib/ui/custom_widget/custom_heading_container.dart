import 'package:flutter/material.dart';

import '../../core/contants/color.dart';
import '../../core/contants/style.dart';

// ignore: must_be_immutable
class CustomHeadingContainer extends StatelessWidget {
  String name;
  CustomHeadingContainer({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334,
      height: 48,
      decoration: BoxDecoration(
          color: KblueColor, borderRadius: BorderRadius.circular(9)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            '$name',
            style: kHeadingParagraph1.copyWith(
                color: kPrimaryColor, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
