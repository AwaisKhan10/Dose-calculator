// ignore_for_file: use_key_in_widget_constructors, no_logic_in_create_state, non_constant_identifier_names, prefer_const_constructors, override_on_non_overriding_member, unused_element

import 'package:dose_calculator/core/contants/color.dart';
import 'package:dose_calculator/core/contants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/contants/style.dart';
import 'onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(() => const OnboardingScreen());
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecodaryColor,

      ///
      /// Start body
      ///
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///
            ///Starting
            ///
            ///Image1 hand dose
            ///
            Center(
              child: Image.asset(
                '$static/image.png',
                scale: 4.5,
              ),
            ),
            SizedBox(
              height: 15,
            ),

            ///
            /// Text
            ///
            Text(
              'Dose Calculator',
              style: kHeading1,
            ),
          ],
        ),
      ),
    );
  }
}
