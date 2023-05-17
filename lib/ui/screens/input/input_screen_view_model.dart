import 'package:dose_calculator/core/contants/color.dart';
import 'package:dose_calculator/core/contants/style.dart';
import 'package:dose_calculator/core/enums/view_state.dart';
import 'package:dose_calculator/core/models/dropdown.dart';
import 'package:dose_calculator/core/models/input.dart';
import 'package:dose_calculator/core/models/result.dart';
import 'package:dose_calculator/core/services/database_service.dart';
import 'package:dose_calculator/core/view_model.dart/base_view_model.dart'
    show BaseViewModel;
import 'package:dose_calculator/ui/screens/result_screen/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/models/antibiotics.dart';

class InputScreenViewModel extends BaseViewModel {
  DatabaseService _databaseService = DatabaseService();

  InputScreenViewModel() {
    getDropDownData();
  }

  ///
  /// drpdown object
  ///
  DropDown dropDown = DropDown();

  ///
  /// String
  ///
  String name = '';

  ///
  ///  created object Input
  ///
  Input input = Input();

  ///
  /// used for condition
  ///
  calculatByWeight() {
    input.isWeight = true;
    input.isAgeInMOnth = false;
    input.isAgeInYear = false;
    name = 'Weight';
    notifyListeners();
  }

  calculatByAge() {
    input.isWeight = false;
    input.isAgeInMOnth = false;
    input.isAgeInYear = true;
    name = 'Year';
    notifyListeners();
  }

  calculatByMonth() {
    input.isWeight = false;
    input.isAgeInMOnth = true;
    input.isAgeInYear = false;
    name = 'Month';
    notifyListeners();
  }

  ///
  /// Controller
  ///
  final textController = TextEditingController();

  ///
  /// String defaultValue
  ///
  String defaultValue = "Select Drug";

  ///
  /// dropDownvalue
  ///
  dropDownvalue(val) {
    defaultValue = val;
    notifyListeners();
  }

  List<Antibiotic> foundUser = [];

  ///
  /// list using for dropdown
  ///
  // List<String> items = [
  //   "Select Drug",
  //   "GIT Drugs",
  //   "Antibiotic Drugs",
  //   "Antiphyretic & Analgestic Drugs",
  //   "Respiratory Tract Drugs",
  //   "Antihistamine & Corticosteroids Drugs ",
  //   "Injection",
  // ];

  HomeViewModel() {
    getResultData();
  }

  ///
  /// Controller
  ///
  final nameController = TextEditingController();

  ///
  /// recordData input
  ///
  recordData() async {
    await _databaseService.addData(input);
  }

  ///
  ///  result get the data
  ///

  List<Result> result = [];
  void initState() {
    getResultData();
  }

  getResultData() async {
    setState(ViewState.busy);
    result = [];
    result = await _databaseService.getResult(input.text!);

    if (result.isNotEmpty) {
      Get.to(() => ResultScreen(
            drugName: '$defaultValue',
            selectYWM: '$name',
            count: '${input.text}',
            result: "${result.first.weight}",
          ));

      print("Dta ====> ${result.first.weight}");
    } else {
      Get.defaultDialog(
          barrierDismissible: true,
          title: 'Wrong',
          titleStyle: kHeadingParagraph1.copyWith(color: KblueColor),
          middleText: 'No used for child',
          middleTextStyle: kHeadingParagraph2.copyWith(color: KblueColor),

          // confirm: Column(
          //   children: [Text('This is used for only child not for youngsters')],
          // ),
          confirmTextColor: KblueColor);
    }

    setState(ViewState.idle);
  }

  ///
  ///DropDown Data
  ///

  List<DropDown> dropdowndata = [];
  getDropDownData() async {
    setState(ViewState.busy);

    dropdowndata = await _databaseService.getDropDownList();
    if (dropdowndata.isNotEmpty) {
      dropDown = dropdowndata.first;
    }
    print("data====> ${dropdowndata.length}");
    setState(ViewState.idle);
  }
}
