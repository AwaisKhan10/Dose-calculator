import 'package:dose_calculator/core/models/contact_us.dart';
import 'package:dose_calculator/core/services/database_service.dart';
import 'package:dose_calculator/core/view_model.dart/base_view_model.dart';
import 'package:flutter/material.dart';

class ContactUsViewModel extends BaseViewModel {
  DatabaseService _databaseService = DatabaseService();

  ///
  /// Object
  ///

  ContactUs contactUs = ContactUs();

  ///
  /// Global key
  ///
  final formkey = GlobalKey<FormState>();

  ///
  /// Email Controller
  ///
  final emailController = TextEditingController();

  ///
  /// Name Controller
  ///
  final nameController = TextEditingController();

  ///
  /// SMS Controller
  ///
  final smsController = TextEditingController();

  ///
  /// dispose
  ///
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
  }

  ///
  /// Function
  ///

  recordContact() async {
    await _databaseService.addData1(contactUs);
  }
}
