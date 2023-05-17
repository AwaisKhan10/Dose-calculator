// ignore_for_file: unused_local_variable

import 'package:dose_calculator/core/enums/view_state.dart';
import 'package:dose_calculator/core/models/drugs_categories.dart';
import 'package:dose_calculator/core/services/database_service.dart';
import 'package:dose_calculator/core/view_model.dart/base_view_model.dart';
import 'package:flutter_zoom_drawer/config.dart';

class HomeViewModel extends BaseViewModel {
  DatabaseService _databaseService = DatabaseService();

  HomeViewModel() {
    getCategories();
  }

  ///
  /// controller
  ///
  final drawerController = ZoomDrawerController();
  // final fireStore = FirebaseFirestore.instance.collection('user').snapshots();

  ///
  /// List of Antiobiotic Container
  ///
  // List<Antibiotic> antibiotic = [
  //   Antibiotic(
  //       id: '',
  //       image: '$static/d1.png',
  //       name: 'GIT Drugs',
  //       backgroundColor: KblueColor),
  //   Antibiotic(
  //       id: '',
  //       image: '$static/d2.png',
  //       name: 'Antibiotic Drugs',
  //       backgroundColor: kPrimaryColor),
  //   Antibiotic(
  //       id: '',
  //       image: '$static/d3.png',
  //       name: '   Antiphyretic   & \n Analgestic Drugs',
  //       backgroundColor: kPrimaryColor),
  //   Antibiotic(
  //       id: '',
  //       image: '$static/d4.png',
  //       name: 'Respiratory Tract '
  //           '\n        Drugs',
  //       backgroundColor: kPrimaryColor),
  //   Antibiotic(
  //       id: '',
  //       image: '$static/d5.png',
  //       name: 'Antihistamine Drugs',
  //       backgroundColor: kPrimaryColor),
  //   Antibiotic(
  //       id: '',
  //       image: '$static/d6.png',
  //       name: 'Injection',
  //       backgroundColor: kPrimaryColor),
  //   Antibiotic(
  //       id: '',
  //       image: '$static/d7.png',
  //       name: 'NOTE',
  //       backgroundColor: kPrimaryColor),
  // ];
  List<DrugsCategory> userCategorieList = [];
  void initState() {
    getCategories();
  }

  getCategories() async {
    setState(ViewState.busy);
    userCategorieList = await _databaseService.getUserList();

    setState(ViewState.idle);

    // if (resultant == null) {
    //   print('Unable to retreive');
    // } else {
    //   // userCategorieList == resultant;
    // }
  }
}
