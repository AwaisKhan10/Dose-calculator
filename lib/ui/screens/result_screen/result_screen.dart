import 'package:dose_calculator/core/contants/style.dart';
import 'package:dose_calculator/ui/custom_widget/custom_heading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/contants/color.dart';
import '../../custom_widget/custom_backbutton.dart';
import 'result_view_model.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  String? drugName;
  String? selectYWM;
  String? count;
  String? result;

  ResultScreen(
      {required this.drugName,
      required this.selectYWM,
      required this.count,
      required this.result,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ResultViewModel(),
        child: Consumer<ResultViewModel>(
          builder: (context, model, child) => Scaffold(
              backgroundColor: kPrimaryColor,

              ///
              /// Appbar
              ///
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                elevation: 0.0,

                ///
                /// Custom BackButton
                ///
                leading: CustomBackButton(
                  iconColor: KblueColor,
                ),

                ///
                /// Center title
                ///
                centerTitle: true,
                title: Text('Result',
                    style: kHeading1.copyWith(color: KblueColor)),
              ),

              ///
              /// Start  body
              ///
              body: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///
                      /// CustomHeadingContainer Input
                      ///
                      CustomHeadingContainer(name: 'Input'),

                      ///
                      /// Drug name
                      ///
                      SizedBox(height: 10.h),
                      Text(
                        'Drug name : $drugName',
                        style: kHeadingParagraph2.copyWith(
                          color: kBlackColor,
                          fontWeight: FontWeight.w100,
                        ),
                      ),

                      ///
                      /// Calculated by year
                      ///
                      Text(
                        'Calculated by $selectYWM',
                        style: kHeadingParagraph2.copyWith(
                          color: kBlackColor,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Text(
                        'Year : $count',
                        style: kHeadingParagraph2.copyWith(
                          color: kBlackColor,
                          fontWeight: FontWeight.w100,
                        ),
                      ),

                      SizedBox(
                        height: 15.0,
                      ),

                      ///
                      /// CustomHeadingContainer  Result
                      ///
                      CustomHeadingContainer(name: 'Result'),

                      ///
                      /// SizedBox
                      ///
                      SizedBox(
                        height: 15.h,
                      ),

                      ///
                      /// Cirlcle icon and text in row
                      ///
                      Row(
                        children: [
                          Icon(
                            Icons.circle_rounded,
                            color: kBlackColor,
                            size: 8,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text('$result'),
                        ],
                      ),

                      ///
                      /// SizedBox
                      ///
                      SizedBox(
                        height: 10.h,
                      ),

                      ///
                      /// Cirlcle icon and text in row
                      ///
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle_rounded,
                            color: kBlackColor,
                            size: 8,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text('$result'),
                        ],
                      ),

                      ///
                      /// SizedBox
                      ///
                      SizedBox(
                        height: 10.h,
                      ),

                      ///
                      /// Cirlcle icon and text in row
                      ///
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle_rounded,
                            color: kBlackColor,
                            size: 8,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text('$result'),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
