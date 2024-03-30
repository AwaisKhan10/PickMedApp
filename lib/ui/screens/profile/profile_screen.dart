import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/ui/custom_widgets/buttons/custom_back_button.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:pickmed/ui/screens/profile/about_us/about_us_screen.dart';
import 'package:pickmed/ui/screens/profile/my_profile/my_profile_screen.dart';
import 'package:pickmed/ui/screens/profile/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProfileViewModel(),
        child: Consumer<ProfileViewModel>(
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
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Profile',
                      style: style22.copyWith(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Image.asset(
                      "$staticAssets/full_name.png",
                      color: blackColor,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Full User Name',
                      style: style22.copyWith(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),

                    ///
                    /// My Profile
                    ///

                    profileContainer(
                        context: context,
                        title: 'My Profile',
                        img: 'profile',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyProfileScreen()));
                        }),

                    ///
                    /// My Profile
                    ///
                    profileContainer(
                        context: context,
                        title: 'My Order',
                        img: 'order',
                        onPressed: () {
                          //            Navigator.push(
                          // context, MaterialPageRoute(builder: (context) => SignInScreen()));
                        }),

                    ///
                    /// My Profile
                    ///
                    profileContainer(
                        context: context,
                        title: 'About Us',
                        img: 'about_us',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutUsScreen()));
                        }),
                  ],
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
    title: CustomBackButton(),
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
