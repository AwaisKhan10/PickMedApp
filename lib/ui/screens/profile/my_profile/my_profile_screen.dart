// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_field_decoration.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/ui/custom_widgets/buttons/custom_back_button.dart';
import 'package:pickmed/ui/screens/profile/my_profile/my_profile_view_model.dart';
import 'package:provider/provider.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyProfileViewModel(),
        child: Consumer<MyProfileViewModel>(
          builder: (context, model, child) => ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            child: Scaffold(
              ///
              /// App Bar
              ///
              appBar: _appBar(context),

              ///
              /// Start Body
              ///
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                    children: [
                      Image.asset(
                        "$staticAssets/full_name.png",
                        color: blackColor,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        '${model.authService.userProfile.fullName}',
                        style: style22.copyWith(fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),

                      ///
                      /// NAME
                      ///
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style:
                                  style14.copyWith(fontWeight: FontWeight.w400),
                            ),
                            TextFormField(
                                style: style14,
                                initialValue:
                                    model.authService.userProfile.fullName,
                                keyboardType: TextInputType.name,
                                onChanged: (value) {
                                  model.authService.userProfile.fullName =
                                      value;
                                },
                                decoration: authFieldDecoration.copyWith(
                                  suffixIcon: TextButton(
                                      onPressed: () {
                                        model.updateUserProfile();
                                      },
                                      child: Text(
                                        'Change',
                                        style: style18.copyWith(
                                            color: greenColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp),
                                      )),
                                  fillColor: Colors.transparent,
                                  hintText: 'User Full Name',
                                  hintStyle: style18.copyWith(
                                      fontWeight: FontWeight.w400),
                                  border: undelineInputBorder(),
                                  enabledBorder: undelineInputBorder(),
                                  focusedBorder: undelineInputBorder(),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      ///
                      /// Phone Number
                      ///
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number',
                              style:
                                  style14.copyWith(fontWeight: FontWeight.w400),
                            ),
                            TextFormField(
                                style: style14,
                                keyboardType: TextInputType.phone,
                                initialValue:
                                    model.authService.userProfile.phoneNumber,
                                onChanged: (value) {
                                  model.authService.userProfile.phoneNumber =
                                      value;
                                },
                                decoration: authFieldDecoration.copyWith(
                                  suffixIcon: TextButton(
                                      onPressed: () {
                                        model.updateUserProfile();
                                      },
                                      child: Text(
                                        'Change',
                                        style: style18.copyWith(
                                            color: greenColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp),
                                      )),
                                  fillColor: Colors.transparent,
                                  hintText: 'User Phone Number',
                                  hintStyle: style18.copyWith(
                                      fontWeight: FontWeight.w400),
                                  border: undelineInputBorder(),
                                  enabledBorder: undelineInputBorder(),
                                  focusedBorder: undelineInputBorder(),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      ///
                      /// Address
                      ///

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address',
                              style:
                                  style14.copyWith(fontWeight: FontWeight.w400),
                            ),
                            TextFormField(
                                style: style14,
                                keyboardType: TextInputType.name,
                                initialValue:
                                    model.authService.userProfile.address,
                                onChanged: (value) {
                                  model.authService.userProfile.address = value;
                                },
                                decoration: authFieldDecoration.copyWith(
                                  suffixIcon: TextButton(
                                      onPressed: () {
                                        model.updateUserProfile();
                                      },
                                      child: Text(
                                        'Change',
                                        style: style18.copyWith(
                                            color: greenColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp),
                                      )),
                                  fillColor: Colors.transparent,
                                  hintText: 'User Address',
                                  hintStyle: style18.copyWith(
                                      fontWeight: FontWeight.w400),
                                  border: undelineInputBorder(),
                                  enabledBorder: undelineInputBorder(),
                                  focusedBorder: undelineInputBorder(),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      ///
                      /// Password
                      ///

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password',
                              style:
                                  style14.copyWith(fontWeight: FontWeight.w400),
                            ),
                            TextFormField(
                                style: style14,
                                readOnly: true,
                                keyboardType: TextInputType.name,
                                decoration: authFieldDecoration.copyWith(
                                  fillColor: Colors.transparent,
                                  hintText: '*********',
                                  hintStyle: style18.copyWith(
                                      fontWeight: FontWeight.w400),
                                  border: undelineInputBorder(),
                                  enabledBorder: undelineInputBorder(),
                                  focusedBorder: undelineInputBorder(),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      ///
                      /// E-mail
                      ///

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'E-mail',
                              style:
                                  style14.copyWith(fontWeight: FontWeight.w400),
                            ),
                            TextFormField(
                                style: style14,
                                readOnly: true,
                                keyboardType: TextInputType.name,
                                initialValue:
                                    model.authService.userProfile.email,
                                decoration: authFieldDecoration.copyWith(
                                  // suffixIcon: TextButton(
                                  //     onPressed: () {},
                                  //     child: Text(
                                  //       'Change',
                                  //       style: style18.copyWith(
                                  //           color: greenColor,
                                  //           fontWeight: FontWeight.w400,
                                  //           fontSize: 16.sp),
                                  //     )),
                                  fillColor: Colors.transparent,
                                  hintText: 'User Email',
                                  hintStyle: style18.copyWith(
                                      fontWeight: FontWeight.w400),
                                  border: undelineInputBorder(),
                                  enabledBorder: undelineInputBorder(),
                                  focusedBorder: undelineInputBorder(),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

_appBar(context) {
  return AppBar(
      backgroundColor: whiteColor,
      automaticallyImplyLeading: false,
      leading: CustomBackButton(),
      title: Text(
        'My profile',
        style: style22,
      ));
}

profileContainer({context, img, title, onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                color: blackColor.withOpacity(0.04),
                spreadRadius: 10,
                blurRadius: 5,
                offset: const Offset(0, 5))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "$staticAssets/$img.png",
                scale: 3,
              ),
              SizedBox(
                width: 20.w,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.4,
                child: Text(
                  '$title',
                  style: style18,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 18.sp,
          )
        ],
      ),
    ),
  );
}

///
/// underline border
///
undelineInputBorder() {
  return UnderlineInputBorder(
    borderSide: BorderSide(width: 1.w, color: const Color(0xff676362)
        // Color of the bottom border
        ),
  );
}
