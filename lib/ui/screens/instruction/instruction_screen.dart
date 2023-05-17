import 'package:dose_calculator/core/contants/color.dart';
import 'package:dose_calculator/core/contants/strings.dart';
import 'package:dose_calculator/core/contants/style.dart';
import 'package:dose_calculator/ui/custom_widget/custom_backbutton.dart';
import 'package:flutter/material.dart';

class InstrustionScreen extends StatelessWidget {
  InstrustionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,

      ///
      /// App Bar
      ///
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,

        ///
        /// Custom Button
        ///
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: CustomBackButton(iconColor: kBlackColor),
        ),

        ///
        /// Center title
        ///
        title: Text(
          'Instruction',
          style: kHeading1.copyWith(color: KblueColor),
        ),
        centerTitle: true,
      ),

      ///
      /// Start body
      ///

      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            ///
            /// as a image use these instructions
            ///
            Image.asset(
              '$static/instructions.png',
              scale: 0.5,
            ),
          ]),
        ),
      ),
    );
  }
}
