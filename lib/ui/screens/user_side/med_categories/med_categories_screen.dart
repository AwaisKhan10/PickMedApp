// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/ui/screens/medicine_list/medicine_detail/medicine_screen.dart';
import 'package:pickmed/ui/screens/profile/profile_screen.dart';
import 'package:pickmed/ui/screens/user_side/med_categories/med_provider.dart';
import 'package:provider/provider.dart';

class MedCategoriesScreen extends StatelessWidget {
  final String name;

  const MedCategoriesScreen({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (contex) => MedCategoriesProvider(name),
      child: Consumer<MedCategoriesProvider>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            /// App Bar
            ///
            appBar: _appBar(context, model),

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

                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      Expanded(
                        child: Text('Medicine Types / $name',
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style:
                                style22.copyWith(fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: model.medicins.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MedicineDetailScreen(
                                          medicineType: model.medicins[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ///
                                        /// Image
                                        ///
                                        Container(
                                          height: 100.h,
                                          width: 150.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: blackColor
                                                        .withOpacity(0.25),
                                                    blurRadius: 4,
                                                    offset: const Offset(0, 4),
                                                    spreadRadius: 0)
                                              ],
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      '$dynamicAssets/img2.png'),
                                                  fit: BoxFit.cover)),
                                        ),
                                        10.horizontalSpace,
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                model.medicins[index].title ??
                                                    " ",
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                style: style18.copyWith(
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: model.medicins[index]
                                                            .price ??
                                                        " ",
                                                    style: style22.copyWith(
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                TextSpan(
                                                    text:
                                                        ' / ${model.medicins[index].categroy ?? " "}',
                                                    style: style22.copyWith(
                                                      fontSize: 14.sp,
                                                    ))
                                              ])),
                                            ],
                                          ),
                                        ),

                                        //   mainAxisAlignment: MainAxisAlignment.center,
                                        //   children: [
                                        //     GestureDetector(
                                        //       onTap: () {
                                        //         Get.to(UpdateScreen(
                                        //           medId: model.medicins[index].id,
                                        //         ));
                                        //       },
                                        //       child: Container(
                                        //         padding: const EdgeInsets.all(5),
                                        //         decoration: BoxDecoration(
                                        //           borderRadius:
                                        //               BorderRadius.circular(15.r),
                                        //           color: greenColor,
                                        //         ),
                                        //         child: Row(
                                        //           mainAxisAlignment:
                                        //               MainAxisAlignment.spaceAround,
                                        //           children: [
                                        //             Text(
                                        //               'Update',
                                        //               style: style18.copyWith(
                                        //                   color: whiteColor),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ),
                                        //     ),
                                        //     20.horizontalSpace,
                                        //     GestureDetector(
                                        //       onTap: () {
                                        //         confirmDialogue(context,
                                        //             message:
                                        //                 'Do you realy want to delete the medicine',
                                        //             confirm: () {
                                        //           model.deleteMed(
                                        //               model.medicins[index].id,
                                        //               index);
                                        //         });
                                        //       },
                                        //       child: Container(
                                        //         padding: const EdgeInsets.all(5),
                                        //         decoration: BoxDecoration(
                                        //           borderRadius:
                                        //               BorderRadius.circular(15.r),
                                        //           color: redColor,
                                        //         ),
                                        //         child: Row(
                                        //           mainAxisAlignment:
                                        //               MainAxisAlignment.spaceAround,
                                        //           children: [
                                        //             Text(
                                        //               'Delete',
                                        //               style: style18.copyWith(
                                        //                   color: whiteColor),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    model.addToCart(model.medicins[index].id!);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: greenColor,
                                            borderRadius:
                                                BorderRadius.circular(4.r)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.w, vertical: 4.h),
                                        child: Image.asset(
                                          "$staticAssets/cart_img.png",
                                          height: 20.h,
                                          width: 20.w,
                                          fit: BoxFit.contain,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                2.verticalSpace,
                                const Divider(
                                  thickness: 1,
                                ),
                              ],
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

  _appBar(context, MedCategoriesProvider model) {
    return AppBar(
      backgroundColor: whiteColor,
      automaticallyImplyLeading: false,
      title: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()));
        },
        child: Image.asset(
          "$staticAssets/menu.png",
          scale: 3.5,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            model.logout();
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
}
