// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/ui/screens/profile/profile_screen.dart';
import 'package:pickmed/ui/screens/user_side/home/user_home_provider.dart';
import 'package:pickmed/ui/screens/user_side/med_categories/med_categories_screen.dart';
import 'package:provider/provider.dart';

class UserHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UserHomeProvider(),
        child: Consumer<UserHomeProvider>(
          builder: (context, model, child) => ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            child: Scaffold(
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
                          text: 'Welcome,',
                          style: style22.copyWith(fontWeight: FontWeight.w400)),
                      TextSpan(
                          text: ' ${model.authService.userProfile.fullName}',
                          style: style22.copyWith(color: brownColor))
                    ])),
                    SizedBox(height: 30.h),

                    ///
                    /// Medicine Types
                    ///
                    SizedBox(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: model.categroies.length,
                          primary: false,
                          itemBuilder: (context, index) {
                            return button(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MedCategoriesScreen(
                                              name: model.categroies[index]
                                                      .category ??
                                                  "",
                                            )));
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => PainRelieverScreen(
                                //               name: model.cats[index],
                                //             )));
                              },
                              text: model.categroies[index].category ?? "",
                              boxColor: lightBlueColor,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

_appBar(context, UserHomeProvider model) {
  return AppBar(
    backgroundColor: whiteColor,
    automaticallyImplyLeading: false,
    title: InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()));
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
