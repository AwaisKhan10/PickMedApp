// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/ui/custom_widgets/buttons/custom_back_button.dart';
import 'package:pickmed/ui/screens/profile/my_profile/my_profile_view_model.dart';
import 'package:provider/provider.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyProfileViewModel(),
        child: Consumer<MyProfileViewModel>(
          builder: (context, model, child) => Scaffold(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "$staticAssets/logo.png",
                          scale: 3,
                        ),
                      ),
                      Text(
                        'Your family health, our priority.',
                        style: style22,
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Divider(
                        thickness: 1,
                        color: blackColor.withOpacity(0.5),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      data(
                        img: 'location',
                        text:
                            '3, PT151G & 152G, Batu 17, 4, Jln Seremban - Tampin, 71300 Rembau, Negeri Sembilan',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Divider(
                        thickness: 1,
                        color: blackColor.withOpacity(0.5),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      data(
                        img: 'ph_no',
                        text: '06 - 685 2388',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Divider(
                        thickness: 1,
                        color: blackColor.withOpacity(0.5),
                      ),
                    ]),
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
        'About US',
        style: style22,
      ));
}

data({img, text}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: Row(
      children: [
        Image.asset(
          "$staticAssets/$img.png",
          scale: 4,
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Text(
            '$text',
            style: style14,
          ),
        ),
      ],
    ),
  );
}
