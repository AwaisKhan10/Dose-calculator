// ignore_for_file: must_be_immutable

import 'package:dose_calculator/core/contants/color.dart';
import 'package:dose_calculator/core/contants/style.dart';
import 'package:dose_calculator/core/models/drugs_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AntibioticContainer extends StatelessWidget {
  DrugsCategory? antibiotic;
  AntibioticContainer({Key? key, this.antibiotic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 0.5, color: kGrayColor),
          ),
          child: Image.network(
            "${antibiotic!.imgUrl}",
            scale: 10,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Center(
          child: Text(
            '${antibiotic!.name}',
            style: kHeadingParagraph2,
          ),
        ),
      ],
    );
  }
}
