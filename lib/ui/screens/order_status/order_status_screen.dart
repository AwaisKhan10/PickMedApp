// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/ui/custom_widgets/custom_stepper.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:pickmed/ui/screens/order_status/order_status_view_model.dart';
import 'package:pickmed/ui/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

class OrderStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (contex) => OrderStatusViewModel(),
      child: Consumer<OrderStatusViewModel>(
        builder: (context, model, child) => Scaffold(
          ///
          /// App Bar
          ///
          appBar: _appBar(context),

          ///
          /// Body
          ///
          body: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                // Container(
                //   width: double.infinity,
                //   height: 300,
                //   child: Theme(
                //     data: ThemeData.light().copyWith(
                //       colorScheme: const ColorScheme.light(
                //         primary: Colors.green, // Active color
                //         secondary: Colors.blue, // Inactive color
                //       ),
                //     ),
                //     child: Stepper(
                //       type: StepperType.horizontal,
                //       steps: model.getSteps(),
                //       currentStep: model.currentStep,
                //       onStepTapped: (step) {
                //         // Handle step tapping here
                //       },
                //       elevation: 2,
                //     ),
                //   ),
                // ),

                // DotStepper(
                //   direction: Axis.horizontal,
                //   dotCount: model.dotCount,
                //   dotRadius: 30,
                //   activeStep: model.currentStep,
                //   shape: Shape.stadium,

                //   spacing: 50,
                //   indicator: Indicator.shift,
                //   onDotTapped: (tappedDotIndex) {
                //     model.currentStep = tappedDotIndex;
                //   },
                //   fixedDotDecoration: const FixedDotDecoration(
                //     color: Colors.deepPurple,
                //   ),
                //   indicatorDecoration: const IndicatorDecoration(
                //     color: Colors.red,
                //   ),
                //   // Specify the line connector decoration to show the line between dots
                //   lineConnectorDecoration: const LineConnectorDecoration(
                //     color: Colors.red, // Color of the line
                //     strokeWidth: 2, // Width of the line
                //   ),
                // ),
                ///
                ///
                ///  In Progress
                ///
                ///  Completed
                ///
                /// Rejected
                ///
                ///
                ///
                const CustomStepper(),

                ///
                /// List Data
                ///
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(4.r),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.04),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(
                      'Order ID: #123456',
                      style: style18.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(4.r),
                    boxShadow: [
                      BoxShadow(
                        color: blackColor.withOpacity(0.04),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Product List:', style: style18),
                      SizedBox(height: 10.h),
                      medicineNameAndPrice(
                        title: '1 X Cap. Celebrex',
                        price: 'RM 40.00',
                      ),
                      medicineNameAndPrice(
                        title: '1 X Cap. Tramadol',
                        price: 'RM 20.00',
                      ),
                      medicineNameAndPrice(
                        title: '1 X Tab. Ibuprofen',
                        price: 'RM 10.00',
                      ),
                    ],
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

AppBar _appBar(BuildContext context) {
  return AppBar(
    backgroundColor: whiteColor,
    automaticallyImplyLeading: false,
    leading: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      },
      child: Image.asset(
        "$staticAssets/menu.png",
        scale: 3.5,
      ),
    ),
    title: Text(
      'Checkout',
      style: style22,
    ),
    centerTitle: true,
    actions: [
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Image.asset(
            "$staticAssets/logout.png",
            scale: 3,
          ),
        ),
      ),
    ],
  );
}

Widget medicineNameAndPrice({required String title, required String price}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style18.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
        ),
        Text(
          price,
          style: style18.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
        ),
      ],
    ),
  );
}
