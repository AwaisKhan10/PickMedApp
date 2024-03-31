// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/core/model/medicine_type.dart';

class CustomMedicineType extends StatelessWidget {
  final MedicineType medicineType;
  const CustomMedicineType({required this.medicineType});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///
            /// Image
            ///
            Container(
              height: 96.h,
              width: 146.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                        color: blackColor.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                        spreadRadius: 0)
                  ],
                  image: DecorationImage(
                      image: AssetImage(
                          '$dynamicAssets/${medicineType.imgUrl}.png'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '${medicineType.medicineName}',
                  style: style18.copyWith(fontWeight: FontWeight.w400),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'RM ${medicineType.price}',
                    style: style18.copyWith(
                        fontSize: 14.sp, fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: ' / blister',
                    style: style18.copyWith(
                        fontSize: 14.sp, fontWeight: FontWeight.w400),
                  )
                ])),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 40.0, bottom: 15),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 28.h,
                    width: 42.w,
                    decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Image.asset(
                      "$staticAssets/shopping-cart.png",
                      scale: 4.5,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
