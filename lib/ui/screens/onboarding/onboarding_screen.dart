// ignore_for_file: prefer_const_constructors

import 'package:dose_calculator/core/contants/color.dart';
import 'package:dose_calculator/core/contants/style.dart';
import 'package:dose_calculator/ui/screens/home/home_screen.dart';
import 'package:dose_calculator/ui/screens/onboarding/onboarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingViewModel(),
      child: Consumer<OnboardingViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: kPrimaryColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Column(children: [
                //
                // start
                //
                Expanded(
                  child: PageView.builder(
                    controller: model.pageController,
                    itemCount: model.onboardings.length,
                    onPageChanged: model.onChanged,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ///
                          /// Images
                          ///
                          Image.asset(
                              '${model.onboardings[index].image.toString()}'),

                          ///
                          /// SizedBox
                          ///
                          SizedBox(
                            height: 25.h,
                          ),

                          ///
                          /// Heading
                          ///
                          Text(
                            model.onboardings[index].title.toString(),
                            style: kHeadingParagraph1,
                          ),

                          ///
                          /// SizedBox
                          ///
                          SizedBox(
                            height: 10.h,
                          ),

                          ///
                          /// text detail
                          ///
                          Text(
                            model.onboardings[index].description.toString(),
                            softWrap: true,
                            style: kHeadingParagraph2,
                          ),

                          ///
                          /// SizedBox
                          ///
                          SizedBox(
                            height: 50.h,
                          ),

                          ///
                          /// Indicator
                          ///
                          AnimatedSmoothIndicator(
                            activeIndex: model.currentPage,
                            count: 2,
                            onDotClicked: (index) => model.pageController
                                .animateToPage(index,
                                    duration: Duration(microseconds: 500),
                                    curve: Curves.easeIn),
                            effect: WormEffect(
                              activeDotColor: KblueColor,
                              dotColor: Colors.black26,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                ///
                /// Get Started Button
                ///
                Column(children: [
                  if (model.currentPage == (model.onboardings.length - 1))
                    TextButton(
                        onPressed: () {
                          ///
                          ///  Jump to  HomeScreen
                          ///
                          Get.offAll(() => HomeScreen());
                        },
                        child: Container(
                          height: 35,
                          width: 185,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: KblueColor),
                          child: Center(
                            child: Text(
                              'Get Started',
                              style: kHeadingParagraph2.copyWith(
                                  color: kPrimaryColor),
                            ),
                          ),
                        ))
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///
                        /// TextButton skip
                        ///
                        TextButton(
                            onPressed: () {
                              ///
                              /// Jump to  HomeScreen
                              ///
                              Get.offAll(() => HomeScreen());
                            },
                            child: Text(
                              'Skip',
                              style: kHeadingParagraph2.copyWith(
                                  color: KblueColor),
                            )),

                        ///
                        /// Container TextButton
                        ///
                        Container(
                          height: 20.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.0),
                              color: KblueColor),

                          ///
                          ///  Next  Button
                          ///
                          child: TextButton(
                              onPressed: () {
                                model.pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              },
                              child: Text(
                                'Next',
                                style: kHeadingParagraph2.copyWith(
                                    color: kPrimaryColor),
                              )),
                        ),
                      ],
                    ),
                ]),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
