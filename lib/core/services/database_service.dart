import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dose_calculator/core/models/contact_us.dart';
import 'package:dose_calculator/core/models/dropdown.dart';
import 'package:dose_calculator/core/models/drugs_categories.dart';
import 'package:dose_calculator/core/models/input.dart';
import 'package:dose_calculator/core/models/result.dart';

class DatabaseService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  addData1(ContactUs contactUs) async {
    try {
      await _db.collection('UserHelp').add(
            contactUs.toJson(),
          );
    } catch (e) {}
  }

  ///
  /// Add the data
  ///

  addData(Input input) async {
    try {
      await _db
          .collection("user")
          .add(
            input.toJson(),
          )
          .then((value) {})
          .onError((error, stackTrace) {
        // Utils().toastMessage(error.toString());
        print('Something else');
      });
    } catch (e) {}
  }

  ///
  ///dropdown
  /// get the from database
  ///
  Future getDropDownList() async {
    List<DropDown> drugList = [];
    try {
      final value = await _db.collection('DropDown').get();
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          drugList.add(DropDown.FromJson(element.data()));
        });
      }
    } catch (e) {}
    return drugList;
  }

  ///
  /// get the data
  ///
  Future getUserList() async {
    List<DrugsCategory> itemsLists = [];
    try {
      final val = await _db.collection('Categories').get();
      if (val.docs.isNotEmpty) {
        val.docs.forEach((element) {
          itemsLists.add(DrugsCategory.fromJson(element.data()));
        });
      }
    } catch (e) {
      print(e.toString());
    }
    return itemsLists;
  }

  ///
  /// Get the result
  ///
  Future getResult(String weight) async {
    List<Result> itemsResult = [];
    try {
      final val = await _db
          .collection('Usages')
          .where(
            "weight",
            isEqualTo: weight,
          )
          .get();
      if (val.docs.isNotEmpty) {
        val.docs.forEach((element) {
          itemsResult.add(Result.fromJson(element.data()));
          print('4===> ${itemsResult.first.weight}');
        });
      }
    } catch (e) {
      print(e.toString());
    }
    return itemsResult;
  }
}
