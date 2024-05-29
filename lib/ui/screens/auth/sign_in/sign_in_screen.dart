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
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_view_model.dart';
import 'package:pickmed/ui/screens/auth/sign_up/sign_up_screen.dart';
import 'package:pickmed/ui/screens/clinic_staff/clinic_staff_screen.dart';
import 'package:pickmed/ui/screens/root/root_screen.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignInViewModel(),
      child: Consumer<SignInViewModel>(builder: (context, model, child) {
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
                          // CustomBackButton(
                          //   color: blackColor,
                          // ),
                          Text(
                            "Sign In account",
                            style: style25,
                          ),
                          Text(
                            "",
                            style: style25,
                          ),
                        ],
                      ),
                      SizedBox(height: 80.h),

                      ///
                      /// E-mail address
                      ///
                      Padding( 
                        padding: const EdgeInsets.only(top: 10.0, bottom: 25),
                        child: TextFormField(
                          style: style14,
                          onChanged: (value) {
                            model.signInBody.email = value;
                          },
                          decoration: authFieldDecoration.copyWith(
                              suffixIcon: Image.asset(
                                '$staticAssets/email.png',
                                scale: 3,
                              ),
                              hintText: 'E-mail address'),
                        ),
                      ),

                      ///
                      /// Password
                      ///
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                        child: TextFormField(
                          style: style14,
                          onChanged: (value) {
                            model.signInBody.password = value;
                          },
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

                      selectBoxRow(
                          onPressed: () {},
                          color: brownColor,
                          title: 'Member       '),
                      SizedBox(
                        height: 30.h,
                      ),
                      selectBoxRow(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ClientStaffScreen()));
                          },
                          border: Border.all(width: 1.0, color: brownColor),
                          title: 'Clinic Staff'),

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
                            model.signUp(context);
                          },
                          text: 'Sign In',
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
                                    builder: (context) => SignUpScreen()));
                          },
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'Not a member? ', style: style14),
                                WidgetSpan(
                                    child: SizedBox(
                                  width: 8.w,
                                )),
                                TextSpan(
                                  text: 'Sign Up',
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

selectBoxRow({border, color, title, onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 26.h,
          width: 26.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: color, border: border),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          '$title',
          style: style18.copyWith(fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}
