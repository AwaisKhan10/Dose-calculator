import 'package:dose_calculator/core/contants/color.dart';
import 'package:dose_calculator/core/contants/style.dart';
import 'package:dose_calculator/core/enums/view_state.dart';
import 'package:dose_calculator/core/models/dropdown.dart';
import 'package:dose_calculator/ui/custom_widget/Custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../custom_widget/custom_backbutton.dart';
import 'input_screen_view_model.dart';

class InputScreen extends StatelessWidget {
  InputScreen({Key? Key, this.hName}) : super(key: Key);
  final hName;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => InputScreenViewModel(),
        child: Consumer<InputScreenViewModel>(
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
              title:
                  Text('$hName', style: kHeading1.copyWith(color: KblueColor)),
            ),

            ///
            /// Start
            ///

            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ///
                      /// DropDown Button
                      ///
                      InputDecorator(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)),
                            fillColor: kLightGray,
                            filled: true,
                            contentPadding: EdgeInsets.all(10.0)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<DropDown>(
                            hint: Text("Select"),
                            value: model.dropDown,
                            items: model.dropdowndata.map((value) {
                              return DropdownMenuItem<DropDown>(
                                value: value,
                                child: Text(
                                  value.name.toString(),
                                  style: kHeadingParagraph2.copyWith(
                                      color: kGrayColor),
                                ),
                              );
                            }).toList(),
                            onChanged: (DropDown? val) {
                              // model.dropDownvalue(newvalue);
                              model.dropDown = val!;
                              model.setState(ViewState.idle);

                              ///
                              /// json input  calling
                              /// store the data in fireStore
                              ///
                            },
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20.h,
                      ),

                      ///
                      /// Text
                      ///
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Calculated by',
                          style: kHeading1.copyWith(color: KblueColor),
                        ),
                      ),

                      ///
                      /// select container
                      ///
                      SizedBox(
                        height: 10.h,
                      ),

                      ///
                      /// customContainer
                      ///

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                model.calculatByAge();
                              },
                              child: customContainer(
                                textColor: model.input.isAgeInYear!
                                    ? kPrimaryColor
                                    : kGrayColor,
                                Color: model.input.isAgeInYear!
                                    ? KblueColor
                                    : kLightGray,
                                tittle: "Year",
                              )),
                          GestureDetector(
                              onTap: () {
                                model.calculatByWeight();
                              },
                              child: customContainer(
                                textColor: model.input.isWeight!
                                    ? kPrimaryColor
                                    : kGrayColor,
                                Color: model.input.isWeight!
                                    ? KblueColor
                                    : kLightGray,
                                tittle: "Weight",
                              )),
                          GestureDetector(
                              onTap: () {
                                model.calculatByMonth();
                              },
                              child: customContainer(
                                textColor: model.input.isAgeInMOnth!
                                    ? kPrimaryColor
                                    : kGrayColor,
                                Color: model.input.isAgeInMOnth!
                                    ? KblueColor
                                    : kLightGray,
                                tittle: "Month",
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),

                      ///
                      /// Enter Year
                      /// FormField
                      ///
                      TextField(
                        controller: model.nameController,

                        ///
                        ///add data
                        ///
                        onChanged: (value) {
                          model.input.text = value;
                        },
                        decoration: InputDecoration(
                          fillColor: kLightGray,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                          hintText: 'Enter ${model.name}',
                          hintStyle:
                              kHeadingParagraph2.copyWith(color: kGrayColor),
                        ),
                      ),

                      SizedBox(
                        height: 20.h,
                      ),

                      ///
                      /// CustomButton
                      ///

                      CustomButton(
                          onTap: () {
                            model.recordData();
                            model.getResultData();
                          },
                          name: 'Calculate',
                          color: KblueColor),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Container customContainer({tittle, Color, textColor}) {
    return Container(
      width: 104,
      height: 37,
      decoration: BoxDecoration(
        color: Color,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Center(
        child: Text(
          '$tittle',
          style: kHeadingParagraph2.copyWith(color: textColor),
        ),
      ),
    );
  }
}
