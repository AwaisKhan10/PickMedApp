// ignore_for_file: use_key_in_widget_constructors, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_field_decoration.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/ui/custom_widgets/buttons/custom_back_button.dart';
import 'package:pickmed/ui/custom_widgets/buttons/custom_button.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:pickmed/ui/screens/auth/sign_up/sign_view_model.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(builder: (context, model, child) {
        return ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          // progressIndicator: CustomLoader(),

          child: Scaffold(
            ///
            /// Start Body
            ///
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomBackButton(
                            color: blackColor,
                          ),
                          Text(
                            "Create an Account",
                            style: style25,
                          ),
                          Text(
                            "",
                            style: style25,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),

                      ///
                      /// E-mail address
                      ///
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 15),
                        child: TextFormField(
                          style: style14,
                          decoration: authFieldDecoration.copyWith(
                              suffixIcon: Image.asset(
                                '$staticAssets/email.png',
                                scale: 3,
                              ),
                              hintText: 'E-mail address'),
                        ),
                      ),

                      ///
                      /// Full name
                      ///
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 15),
                        child: TextFormField(
                          style: style14,
                          decoration: authFieldDecoration.copyWith(
                              suffixIcon: Image.asset(
                                '$staticAssets/full_name.png',
                                scale: 3,
                              ),
                              hintText: 'Full name'),
                        ),
                      ),

                      ///
                      /// Address
                      ///
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 15),
                        child: TextFormField(
                          style: style14,
                          decoration: authFieldDecoration.copyWith(
                              suffixIcon: Image.asset(
                                '$staticAssets/address.png',
                                scale: 3,
                              ),
                              hintText: 'Address'),
                        ),
                      ),

                      ///
                      /// Phone number
                      ///
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 15),
                        child: TextFormField(
                          style: style14,
                          decoration: authFieldDecoration.copyWith(
                              suffixIcon: Image.asset(
                                '$staticAssets/phone_number.png',
                                scale: 3,
                              ),
                              hintText: 'Phone number'),
                        ),
                      ),

                      ///
                      /// Password
                      ///
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 15),
                        child: TextFormField(
                          style: style14,
                          decoration: authFieldDecoration.copyWith(
                              suffixIcon: Image.asset(
                                '$staticAssets/password.png',
                                scale: 3,
                              ),
                              hintText: 'Password'),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),

                      ///
                      /// Custom Button
                      ///
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: CustomButton(
                          borderRadius: BorderRadius.circular(25.r),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => RootScreen()));
                          },
                          text: 'Create Account',
                          boxColor: brownColor,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      ///
                      /// Already have an Account
                      ///
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()));
                          },
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Already have an account?',
                                    style: style14),
                                WidgetSpan(
                                    child: SizedBox(
                                  width: 8.w,
                                )),
                                TextSpan(
                                  text: 'Sign In',
                                  style: style14.copyWith(
                                      color: blueColor,
                                      fontWeight: FontWeight.w500),
                                )
                              ])),
                        ),
                      ),

                      SizedBox(
                        height: 20.h,
                      ),
                    ]),
              ),
            ),
          ),
        );
      }),
    );
  }
}
