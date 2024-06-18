// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_field_decoration.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/ui/custom_widgets/custom_medicine_type.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:pickmed/ui/screens/medicine_list/medicine_view_model.dart';
import 'package:pickmed/ui/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

class MedicineScreen extends StatelessWidget {
  String? title;
  MedicineScreen({required this.title});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (contex) => MedicineViewModel(),
      child: Consumer<MedicineViewModel>(
        builder: (context, model, child) => Scaffold(
          /// App Bar
          ///
          appBar: _appBar(context),

          ///
          /// Start Body
          ///
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
            child: Column(
              children: [
                ///
                /// Seqarch
                ///
                TextFormField(
                  decoration: authFieldDecoration.copyWith(
                      hintText: 'Search',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: blackColor,
                      )),
                ),
                SizedBox(
                  height: 20.h,
                ),

                ///
                /// Back Button and Title
                ///
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new,
                        size: 18.sp,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Medicine Type / $title',
                        style: style18.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),

                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.medicinelist.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => MedicineDetailScreen(
                          //               medicineType: model.medicinelist[index],
                          //             )));
                        },
                        child: CustomMedicineType(
                          medicineType: model.medicinelist[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
