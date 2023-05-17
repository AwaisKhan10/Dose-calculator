import 'package:dose_calculator/core/contants/color.dart';
import 'package:dose_calculator/core/contants/style.dart';
import 'package:dose_calculator/ui/screens/menu/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../custom_widget/antibiotic_containers.dart';
import '../input/input_screen.dart';
import 'home_view_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
            builder: (context, model, child) => Scaffold(
                  backgroundColor: kPrimaryColor,

                  ///
                  /// App bar
                  ///
                  appBar: AppBar(
                    backgroundColor: kPrimaryColor,
                    elevation: 0.0,
                    leading: InkWell(
                        onTap: () {
                          model.drawerController.toggle!();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Icon(
                            Icons.menu,
                            size: 25,
                            color: kBlackColor,
                          ),
                        )),
                    title: Center(
                      child: Text(
                        'Dose Calculator',
                        style: kHeading1.copyWith(color: KblueColor),
                      ),
                    ),
                  ),

                  ///
                  /// Start body
                  ///
                  body: ZoomDrawer(
                      angle: 0.0,
                      showShadow: true,
                      // slideWidth: MediaQuery.of(context).size.width *
                      //     (ZoomDrawer.of(context) != null ? 45 : 0.65),
                      controller: model.drawerController,
                      openCurve: Curves.fastOutSlowIn,
                      closeCurve: Curves.bounceIn,

                      ///
                      /// Menu Screen
                      ///
                      menuScreen: MenuScreen(),

                      ///
                      /// Main HomeScreen
                      ///
                      mainScreen:

                          ///
                          /// Container list
                          ///
                          /// GridView.builder can be used
                          ///
                          Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          GridView.builder(
                            itemCount: model.userCategorieList.length,
                            // itemCount: model.antibiotic.length,
                            shrinkWrap: true,

                            ///
                            /// GestureDetector used for passing (name) in InputScreen
                            ///
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Get.to(() => InputScreen(
                                      hName:
                                          '${model.userCategorieList[index].name}',
                                    ));
                              },
                              child: AntibioticContainer(
                                antibiotic: model.userCategorieList[index],
                              ),
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 6, crossAxisCount: 2),
                          ),
                        ],
                      )),
                )));
  }
}
