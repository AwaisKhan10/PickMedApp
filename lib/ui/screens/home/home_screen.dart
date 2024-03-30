import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/ui/custom_widgets/buttons/custom_button.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:pickmed/ui/screens/home/home_view_model.dart';
import 'package:pickmed/ui/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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
            appBar: _appBar(context),

            ///
            /// Start Body
            ///
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        text: ' User',
                        style: style22.copyWith(color: brownColor))
                  ])),
                  SizedBox(
                    height: 50.h,
                  ),

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
                          Text(
                            'Medicine Types',
                            style: style22,
                          ),
                          button(
                            onPressed: () {},
                            text: 'Pain Relievers',
                            boxColor: lightRedColor,
                          ),
                          button(
                            onPressed: () {},
                            text: 'Antihistamine / Allergy',
                            boxColor: lightBlueColor,
                          ),
                          button(
                            onPressed: () {},
                            text: 'Antacids',
                            boxColor: lightRedColor,
                          ),
                          button(
                            onPressed: () {},
                            text: 'Cough / Cold Medicines',
                            boxColor: lightBlueColor,
                          ),
                          button(
                            onPressed: () {},
                            text: 'Digestive Aids',
                            boxColor: lightRedColor,
                          ),
                          button(
                            onPressed: () {},
                            text: 'Others',
                            boxColor: lightBlueColor,
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

_appBar(context) {
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInScreen()));
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
              fontWeight: FontWeight.w400,
              fontFamily: allerta),
        ),
      ),
    ),
  );
}
