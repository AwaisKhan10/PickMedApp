// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/ui/screens/home/home_view_model.dart';
import 'package:pickmed/ui/screens/medicine_list/medicine_screen.dart';
import 'package:pickmed/ui/screens/profile/profile_screen.dart';
import 'package:pickmed/ui/screens/update_medicine/pain_reliever.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/text_style.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
          builder: (context, model, child) => Scaffold(
            ///
            /// App Bar
            ///
            appBar: AppBar(
              automaticallyImplyLeading: true,
            ),

            ///
            /// Start Body
            ///
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ///
                  /// Welcome User
                  ///

                  ///
                  /// Medicine Types
                  ///
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Update Medicine',
                              style: style22,
                            ),
                          ),
                          30.verticalSpace,
                          button(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => PainRelieverScreen(),
                              //     ));
                            },
                            text: 'Pain Relievers',
                            boxColor: lightBlueColor,
                          ),
                          button(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MedicineScreen(
                                            title: 'Antihistamine / Allergy',
                                          )));
                            },
                            text: 'Antihistamine / Allergy',
                            boxColor: texfieldColor,
                          ),
                          button(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MedicineScreen(
                                            title: 'Antacids',
                                          )));
                            },
                            text: 'Antacids',
                            boxColor: lightBlueColor,
                          ),
                          button(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MedicineScreen(
                                            title: 'Cough / Cold Medicines',
                                          )));
                            },
                            text: 'Cough / Cold Medicines',
                            boxColor: texfieldColor,
                          ),
                          button(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MedicineScreen(
                                            title: 'Digestive Aids',
                                          )));
                            },
                            text: 'Digestive Aids',
                            boxColor: lightBlueColor,
                          ),
                          button(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MedicineScreen(
                                            title: 'Others',
                                          )));
                            },
                            text: 'Others',
                            boxColor: texfieldColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

_appBar(context, HomeViewModel model) {
  return AppBar(
    backgroundColor: whiteColor,
    automaticallyImplyLeading: false,
    title: InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      },
      child: Image.asset(
        "$staticAssets/menu.png",
        scale: 3.5,
      ),
    ),
    actions: [
      InkWell(
        onTap: () {
          model.logout();
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Image.asset(
            "$staticAssets/logout.png",
            scale: 3,
          ),
        ),
      ),
    ],
  );
}

button({
  onPressed,
  boxColor,
  text,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15.0),
    child: GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: boxColor, borderRadius: BorderRadius.circular(35.r)),
        child: Text(
          "$text",
          style: style22.copyWith(
              color: blackColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              fontFamily: allerta),
        ),
      ),
    ),
  );
}
