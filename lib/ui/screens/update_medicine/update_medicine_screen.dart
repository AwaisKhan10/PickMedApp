// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/ui/screens/update_medicine/pain_reliever.dart';
import 'package:pickmed/ui/screens/update_medicine/update_madicin_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/text_style.dart';

class UpdateMedicineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UpdateMadicinProvider(),
        child: Consumer<UpdateMadicinProvider>(
          builder: (context, model, child) => ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            child: Scaffold(
              ///
              /// App Bar
              ///
              appBar: AppBar(
                automaticallyImplyLeading: true,
              ),

              ///
              /// Start Body
              ///
              body: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
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
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Update Medicine',
                                style: style22,
                              ),
                            ),
                            30.verticalSpace,
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: model.cats.length,
                                primary: false,
                                itemBuilder: (context, index) {
                                  return button(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PainRelieverScreen(
                                                    name: model.cats[index],
                                                  )));
                                    },
                                    text: model.cats[index],
                                    boxColor: lightBlueColor,
                                  );
                                }),

                            // button(
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 PainRelieverScreen()));
                            //   },
                            //   text: 'Pain Relieveres',
                            //   boxColor: lightBlueColor,
                            // ),
                            // button(
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => AllergyScreen()));
                            //   },
                            //   text: 'Antihistamine / Allergy',
                            //   boxColor: texfieldColor,
                            // ),
                            // button(
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 AntacidsScreen()));
                            //   },
                            //   text: 'Antacids',
                            //   boxColor: lightBlueColor,
                            // ),
                            // button(
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => CoughScreen()));
                            //   },
                            //   text: 'Cough / Cold Medicines',
                            //   boxColor: texfieldColor,
                            // ),
                            // button(
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 DigestiveScreen()));
                            //   },
                            //   text: 'Digestive Aids',
                            //   boxColor: lightBlueColor,
                            // ),
                            // button(
                            //   onPressed: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => OtherScreen()));
                            //   },
                            //   text: 'Others',
                            //   boxColor: texfieldColor,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
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
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              fontFamily: allerta),
        ),
      ),
    ),
  );
}
