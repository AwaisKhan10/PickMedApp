// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/ui/screens/add_medicin/add_medicin_screen.dart';
import 'package:pickmed/ui/screens/clinic_staff/clinic_staff_screen.dart';
import 'package:pickmed/ui/screens/home/home_view_model.dart';
import 'package:pickmed/ui/screens/profile/profile_screen.dart';
import 'package:pickmed/ui/screens/update_medicine/update_medicine_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/text_style.dart';

class HomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
          builder: (context, model, child) => Scaffold(
            ///
            /// App Bar
            ///
            appBar: _appBar(context, model),

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
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Home Page,',
                        style: style22.copyWith(fontWeight: FontWeight.w400)),
                    // TextSpan(
                    //     text: ' ${model.authService.userProfile.fullName}',
                    //     style: style22.copyWith(color: brownColor))
                  ])),
                  SizedBox(height: 30.h),

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
                          button(
                            onPressed: () {
                              Get.to(AddMedicinScreen());
                            },
                            text: 'ADD MEDICINE',
                            boxColor: lightRedColor,
                          ),
                          30.verticalSpace,
                          button(
                            onPressed: () {
                              Get.to(UpdateMedicineScreen());
                            },
                            text: 'update medicine',
                            boxColor: lightRedColor,
                          ),
                          30.verticalSpace,
                          button(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ClientStaffScreen()));
                            },
                            text: 'ORDER LIST',
                            boxColor: lightRedColor,
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
              color: whiteColor,
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
              fontFamily: allerta),
        ),
      ),
    ),
  );
}
