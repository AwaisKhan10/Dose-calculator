import 'package:dose_calculator/core/contants/color.dart';
import 'package:dose_calculator/ui/screens/about_us/about_us_screen.dart';
import 'package:dose_calculator/ui/screens/instruction/instruction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/contants/strings.dart';
import '../../../core/contants/style.dart';
import '../contact_us/contact_us_screen.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KblueColor,

      ///
      /// Start body
      ///
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ///
            /// Header Image
            ///
            Image.asset(
              '$static/image.png',
              scale: 5,
            ),
            Text(
              'Dose Calculator',
              style: kHeadingParagraph2.copyWith(color: kPrimaryColor),
            ),

            SizedBox(
              height: 20,
            ),

            ///
            ///  Sidebar Icon
            ///
            SidebarIcons(
              ///
              /// Equation & resouces
              ///
              ontap: () {
                Get.to(() => InstrustionScreen());
              },
              image: '$static/equation.png',
              name: 'Equation & resouces',
            ),
            SidebarIcons(
              ///
              /// Contact Us
              ///
              image: '$static/contact.png',
              name: 'Contact Us',
              ontap: () {
                Get.to(() => ContactUsScreen());
              },
            ),

            ///
            /// About Us
            ///
            SidebarIcons(
              image: '$static/about.png',
              name: 'About Us',
              ontap: () {
                Get.to(() => AboutUsScreen());
              },
            ),

            ///
            /// Share
            ///
            SidebarIcons(
              image: '$static/share.png',
              name: 'Share',
              ontap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarIcons extends StatelessWidget {
  final image;
  final name;
  final ontap;

  const SidebarIcons({
    Key? key,
    required this.image,
    required this.name,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///
        /// Start
        ///
        Row(
          children: [
            ///
            /// image
            ///
            Align(
              child: Image.asset(
                image,
                scale: 6,
                color: kPrimaryColor,
              ),
            ),

            ///
            /// Text Button
            ///
            TextButton(
              onPressed: ontap,
              child: Text('$name',
                  style: kHeadingParagraph2.copyWith(
                      color: kPrimaryColor, fontWeight: FontWeight.normal)),
            ),
          ],
        ),

        ///
        /// Divider
        ///
        Container(
          child: Divider(
            color: kPrimaryColor,
            height: 0,
            thickness: 1.0,
            indent: 3,
            endIndent: 10,
          ),
        ),
      ],
    );
  }
}
