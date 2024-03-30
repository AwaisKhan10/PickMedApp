// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/strings.dart';
import 'package:pickmed/core/constants/text_style.dart';

class CustomButton extends StatelessWidget {
  final onPressed;
  String? text;
  Color? textColor;
  Color? boxColor;
  BorderRadius? borderRadius;
  CustomButton(
      {this.onPressed,
      this.text,
      this.textColor,
      this.boxColor,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: boxColor,
              borderRadius: borderRadius ?? BorderRadius.circular(35.r)),
          child: Text(
            "$text",
            style: style18.copyWith(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontFamily: allerta),
          ),
        ),
      ),
    );
  }
}
