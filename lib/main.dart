import 'package:dose_calculator/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/contants/color.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  ///
  /// Firebase setup
  ///
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(Get.height, Get.width),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dose-Calculator-Mater',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
