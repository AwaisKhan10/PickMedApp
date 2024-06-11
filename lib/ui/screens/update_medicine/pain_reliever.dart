// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/ui/custom_widgets/confirm_dialogue.dart';
import 'package:pickmed/ui/screens/medicine_list/medicine_detail/medicine_screen.dart';
import 'package:pickmed/ui/screens/update_medicine/pain_reliever_provider.dart';
import 'package:pickmed/ui/screens/update_medicine/update/update_screen.dart';
import 'package:provider/provider.dart';

class PainRelieverScreen extends StatelessWidget {
  final name;

  const PainRelieverScreen({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (contex) => PainRelieverProvider(name),
      child: Consumer<PainRelieverProvider>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            /// App Bar
            ///
            appBar: AppBar(
              automaticallyImplyLeading: true,
            ),

            ///
            /// Start Body
            ///
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///
                  /// Back Button and Title
                  ///

                  Text('Pain Relievers',
                      style: style22.copyWith(fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: model.medicins.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MedicineDetailScreen(
                                  medicineType: model.medicins[index],
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: IntrinsicHeight(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ///
                                  /// Image
                                  ///
                                  Container(
                                    height: 120.h,
                                    width: 200.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  blackColor.withOpacity(0.25),
                                              blurRadius: 4,
                                              offset: const Offset(0, 4),
                                              spreadRadius: 0)
                                        ],
                                        image: DecorationImage(
                                            image: AssetImage(
                                                '$dynamicAssets/img2.png'),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    model.medicins[index].title ?? " ",
                                    style: style18.copyWith(
                                        fontWeight: FontWeight.w400),
                                  ),
                                  10.verticalSpace,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(UpdateScreen(
                                            medId: model.medicins[index].id,
                                          ));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                            color: greenColor,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'Update',
                                                style: style18.copyWith(
                                                    color: whiteColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      20.horizontalSpace,
                                      GestureDetector(
                                        onTap: () {
                                          confirmDialogue(context,
                                              message:
                                                  'Do you realy want to delete the medicine',
                                              confirm: () {
                                            model.deleteMed(
                                                model.medicins[index].id,
                                                index);
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                            color: redColor,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'Delete',
                                                style: style18.copyWith(
                                                    color: whiteColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  10.verticalSpace,
                                  Divider(
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}
