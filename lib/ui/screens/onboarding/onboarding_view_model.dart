import 'package:dose_calculator/core/view_model.dart/base_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/contants/color.dart';
import '../../../core/contants/strings.dart';
import '../../../core/models/onboarding.dart';

class OnboardingViewModel extends BaseViewModel {
  ///
  ///page controller
  ///
  final PageController pageController = PageController(initialPage: 0);

  ///
  /// index
  /// int
  ///
  int currentPage = 0;

  ///
  /// Bool
  ///
  bool isLastPage = false;

  ///
  ///  List onboardings
  ///
  List<Onboarding> onboardings = [
    Onboarding(
        image: '$static/image1.png',
        buttonColor: kPrimaryColor,
        backgroundColor: kSecodaryColor,
        title: 'Lorem Ipsum',
        description:
            'Quisque maximus dignissim neque,\nvitae  maximus  enim  mollis  ac.  Ut,\n    tincidunt leo id lorem posuere.'),
    Onboarding(
      image: '$static/image2.png',
      buttonColor: kPrimaryColor,
      backgroundColor: kSecodaryColor,
      title: 'Lorem Ipsum',
      description:
          'Quisque maximus dignissim neque,\nvitae  maximus  enim  mollis  ac.  Ut,\n      tincidunt leo id lorem posuere.',
    ),
  ];

  ///
  /// chnage the value
  ///

  onChanged(int value) {
    currentPage = value;
    notifyListeners();
  }
}
