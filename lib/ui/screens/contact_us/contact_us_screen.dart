import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dose_calculator/core/contants/color.dart';
import 'package:dose_calculator/core/contants/style.dart';
import 'package:dose_calculator/ui/custom_widget/Custom_button.dart';
import 'package:dose_calculator/ui/custom_widget/custom_backbutton.dart';
import 'package:dose_calculator/ui/screens/contact_us/contact_us_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);

  ///
  /// FireStore
  ///
  final fireStore = FirebaseFirestore.instance.collection('user');
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactUsViewModel(),
      child: Consumer<ContactUsViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: kPrimaryColor,

          ///
          ///Appbar
          ///
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: kPrimaryColor,

            ///
            /// CustomBackButton
            ///
            leading: CustomBackButton(iconColor: kBlackColor),

            ///
            /// Center title
            ///
            centerTitle: true,
            title: Text(
              'About Us',
              style: kHeading1.copyWith(color: kBlackColor),
            ),
          ),

          ///
          /// Start body
          ///
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              ///
              /// Formkey used
              ///
              key: model.formkey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///
                    /// Header Text
                    ///
                    Text(
                      'Send Us a message!',
                      style: kHeadingParagraph1.copyWith(color: kBlackColor),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),

                    ///
                    /// Text
                    ///
                    Text(
                      'How can we help you?',
                      style: kHeadingParagraph2.copyWith(
                          fontWeight: FontWeight.normal, color: kBlackColor),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    ///
                    /// Text Name
                    ///
                    Text(
                      'Name',
                      style: kHeadingParagraph2.copyWith(
                          fontWeight: FontWeight.w500, color: KblueColor),
                    ),

                    ///
                    /// TextField name
                    ///
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: model.nameController,
                      decoration: InputDecoration(
                        hintText: 'Write your name',
                        hintStyle: kHeadingParagraph2.copyWith(
                            color: kLightGray1, fontWeight: FontWeight.normal),
                      ),

                      onChanged: (value) {
                        model.contactUs.name = value;
                      },

                      ///
                      /// Validator
                      ///  Conditions
                      ///
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    ///
                    /// Text Email
                    ///
                    Text(
                      'Email',
                      style: kHeadingParagraph2.copyWith(
                          fontWeight: FontWeight.w500, color: KblueColor),
                    ),

                    ///
                    /// TextField Emial
                    ///
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: model.emailController,
                      decoration: InputDecoration(
                        hintText: 'Write your email ...',
                        hintStyle: kHeadingParagraph2.copyWith(
                            color: kLightGray1, fontWeight: FontWeight.normal),
                      ),

                      ///
                      /// onchanged
                      ///
                      onChanged: (value) {
                        model.contactUs.email = value;
                      },

                      ///
                      /// Validator
                      ///  Conditions
                      ///
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    ///
                    ///  TextField
                    /// write your message
                    ///
                    TextFormField(
                      controller: model.smsController,
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: 'Write your  message',
                        hintStyle: kHeadingParagraph2.copyWith(
                            color: kLightGray1, fontWeight: FontWeight.normal),
                        // contentPadding:
                        //     EdgeInsets.only(bottom: 130, left: 10, right: 10),
                        fillColor: kLightGray,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kLightGray, width: 1.0),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kLightGray, width: 1.0),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        // errorBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: kGrayColor, width: 1.0),
                        //   borderRadius: BorderRadius.circular(14.0),
                        // ),
                      ),
                      onChanged: (value) {
                        model.contactUs.sms = value;
                      },

                      ///
                      /// Validator
                      ///  Conditions
                      ///
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your message';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),

                    ///
                    /// CustomButton
                    /// Submit
                    ///

                    CustomButton(
                        onTap: () {
                          model.recordContact();
                        },
                        name: 'Submit',
                        color: KblueColor),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
