import 'package:dose_calculator/core/contants/color.dart';
import 'package:dose_calculator/core/contants/strings.dart';
import 'package:dose_calculator/core/contants/style.dart';
import 'package:dose_calculator/ui/custom_widget/custom_backbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        ///
        /// Start Body
        ///
        body: SingleChildScrollView(
      child: SafeArea(
        ///
        /// Stack
        ///
        child: Stack(
          children: [
            ///
            /// Image
            ///
            Image.asset(
              '$static/aboutus.png',
              scale: 4.0,
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///
                      /// CustomBackButton
                      ///
                      CustomBackButton(iconColor: kPrimaryColor),

                      SizedBox(
                        width: 45.h,
                      ),

                      ///
                      /// Center title Text
                      ///
                      Text(
                        'About Us',
                        style: kHeading1.copyWith(color: kPrimaryColor),
                      ),
                    ],
                  ),

                  ///
                  /// SizedBox'
                  ///
                  SizedBox(
                    height: 20.h,
                  ),

                  ///
                  /// Text
                  ///
                  Text(
                    "Maecenas  congue justo  in  turpis  tincidunt,  id"
                    "tincidunt ex interdum. Donec maximus ultricies"
                    "pellentesque. Integer bibendum sem  eget arcu"
                    "sagittis, a hendrerit sapien commodo. Ut  erat in"
                    "maximus vel  erat  id  imperdiet. Cras  quis  nunc"
                    "sed augue iaculis volutpat sit amet non felis.Ma"
                    "tincidunt ex interdum. Donec maximus ultricies"
                    "pellentesque",
                    style: kHeadingParagraph2.copyWith(
                        color: kPrimaryColor, fontWeight: FontWeight.normal),
                  ),

                  ///
                  /// SizedBox'
                  ///
                  SizedBox(
                    height: 20.h,
                  ),

                  ///
                  /// Text
                  ///
                  Text(
                    "Maecenas  congue justo  in  turpis  tincidunt,  id"
                    "tincidunt ex interdum. Donec maximus ultricies"
                    "pellentesque. Integer bibendum sem  eget arcu"
                    "sagittis, a hendrerit sapien commodo. Ut  erat in"
                    "maximus vel  erat  id  imperdiet. Cras  quis  nunc"
                    "sed augue iaculis volutpat sit amet non felis.Ma"
                    "tincidunt ex interdum. Donec maximus ultricies"
                    "pellentesque.",
                    style: kHeadingParagraph2.copyWith(
                        color: kPrimaryColor, fontWeight: FontWeight.normal),
                  ),

                  ///
                  /// SizedBox'
                  ///
                  SizedBox(
                    height: 20.h,
                  ),

                  ///
                  /// Text
                  ///
                  Text(
                    "Maecenas  congue justo  in  turpis  tincidunt,  id"
                    "tincidunt ex interdum. Donec maximus ultricies"
                    "pellentesque. Integer bibendum sem  eget arcu"
                    "sagittis, a hendrerit sapien commodo. Ut  erat in"
                    "maximus vel  erat  id  imperdiet. Cras  quis  nunc"
                    "sed augue iaculis volutpat sit amet non felis.Ma"
                    "tincidunt ex interdum. Donec maximus ultricies"
                    "pellentesque.",
                    style: kHeadingParagraph2.copyWith(
                        color: kPrimaryColor, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
