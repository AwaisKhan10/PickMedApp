import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/ui/custom_widgets/buttons/custom_button.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:pickmed/ui/screens/auth/sign_up/sign_up_screen.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Wrap with Scaffold
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80.h,
            ),

            ///
            /// logo
            ///
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "$staticAssets/logo.png",
                scale: 3,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),

            ///
            /// title
            ///
            Text(
              "Your family health, \nour priority.",
              textAlign: TextAlign.center,
              style: style24.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),

      ///
      /// Bottom Sheet
      ///
      bottomSheet: Container(
        height: MediaQuery.sizeOf(context).height * 0.45,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r)),
            color: darkBlueColor),
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0, left: 25, right: 25),
          child: Column(
            children: [
              Text(
                "STOCK UP ON YOUR MEDICINE NOW!",
                textAlign: TextAlign.center,
                style: style18.copyWith(
                  color: whiteColor,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                text: 'CREATE AN ACCOUNT',
                textColor: blackColor,
                boxColor: whiteColor,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
              ),
              CustomButton(
                text: 'SIGN IN',
                textColor: blackColor,
                boxColor: whiteColor,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
