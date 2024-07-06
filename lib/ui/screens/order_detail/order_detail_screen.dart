// ignore_for_file: use_key_in_widget_constructors, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/order.dart';
import 'package:pickmed/ui/custom_widgets/buttons/custom_button.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:pickmed/ui/screens/order_detail/order_detail_view_model.dart';
import 'package:provider/provider.dart';

class OrderDetailScreen extends StatelessWidget {
  final Orders orderList;
  const OrderDetailScreen({required this.orderList});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderDetailViewModel(orderList),
      child: Consumer<OrderDetailViewModel>(
        builder: (context, model, child) {
          return ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            // progressIndicator: CustomLoader(),

            child: Scaffold(
              ///
              /// App Bar
              ///
              appBar: _appBar(context),

              ///
              /// Body
              ///
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              size: 16.sp,
                              color: blackColor,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Back",
                              style:
                                  style18.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),

                      ///
                      /// Data User
                      ///
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${orderList.fullname}", style: style22),
                            SizedBox(
                              height: 10.h,
                            ),
                            // Text(
                            //   "Phone Number: +923039639571",
                            //   style:
                            //       style18.copyWith(fontWeight: FontWeight.w400),
                            // ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Total (RM) : ${orderList.price ?? ""}",
                              style:
                                  style18.copyWith(fontWeight: FontWeight.w400),
                            ),
                            // SizedBox(
                            //   height: 20.h,
                            // ),
                          ],
                        ),
                      ),
                      // Divider(
                      //   thickness: 1,
                      //   color: blackColor.withOpacity(0.5),
                      // ),

                      ///
                      /// name of medicine something like that
                      ///
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       // Text("1  X  Cap. Celebrex",
                      //       //     style: style18.copyWith(
                      //       //         fontWeight: FontWeight.w400)),
                      //       // SizedBox(
                      //       //   height: 10.h,
                      //       // ),
                      //       // Text(
                      //       //   "1  X  Cap. Tramadol",
                      //       //   style:
                      //       //       style18.copyWith(fontWeight: FontWeight.w400),
                      //       // ),
                      //       // SizedBox(
                      //       //   height: 10.h,
                      //       // ),
                      //       Text(
                      //         orderList.orderStatus ?? "",
                      //         style:
                      //             style18.copyWith(fontWeight: FontWeight.w400),
                      //       ),
                      //       // SizedBox(
                      //       //   height: 20.h,
                      //       // ),
                      //     ],
                      //   ),
                      // ),

                      Divider(
                        thickness: 1,
                        color: blackColor.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ),

              ///
              /// Bottom Sheet
              ///
              bottomSheet: Container(
                height: MediaQuery.sizeOf(context).height * 0.25,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 60, right: 60),
                color: Colors.transparent,
                child: Column(
                  children: [
                    CustomButton(
                      boxColor: blueColor,
                      text: 'COMPLETE ORDER',
                      textColor: whiteColor,
                      onPressed: () {
                        model.getUpdateOrderStatus(isCompleted: true);
                        // model.updateOrderStatus(orderList, 'Completed');
                        // model.setState(ViewState.idle);
                        // Get.back(result: true);
                      },
                    ),
                    CustomButton(
                      boxColor: brownColor,
                      text: 'REJECTED ORDER',
                      textColor: whiteColor,
                      onPressed: () {
                        model.getUpdateOrderStatus(isCompleted: false);
                        // model.updateOrderStatus(orderList, 'Rejected');
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

_appBar(context) {
  return AppBar(
    backgroundColor: whiteColor,
    automaticallyImplyLeading: false,
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
            scale: 2.5,
          ),
        ),
      ),
    ],
  );
}
