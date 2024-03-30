import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';
import 'package:pickmed/core/model/order_list.dart';

class CustomOrderList extends StatelessWidget {
  final OrderList orderList;
  const CustomOrderList({required this.orderList});

  @override
  Widget build(BuildContext context) {
    Color statusColor = greenColor; // Default color

    // Set color based on status
    switch (orderList.status) {
      case 'Rejected':
        statusColor = redColor;
        break;
      case 'Completed':
        statusColor = darkBlueColor;
        break;
      default:
        statusColor = greenColor; // Set default color
        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: blueColor.withOpacity(0.07),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: blueColor.withOpacity(0.07),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "$staticAssets/full_name.png",
            scale: 2,
            color: blackColor,
          ),
          SizedBox(width: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${orderList.username}",
                style: style18,
              ),
              Text(
                "Total (RM) : ${orderList.totalRm}",
                style: style18.copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 6.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Status : ',
                      style: style14.copyWith(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: '${orderList.status}',
                      style: style14.copyWith(
                        color: statusColor, // Use the status color
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
