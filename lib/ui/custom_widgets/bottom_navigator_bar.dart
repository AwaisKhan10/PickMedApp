// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:pickmed/core/constants/colors.dart';

class CustomBottomNavigarBar extends StatelessWidget {
  final onTap;
  String? image;
  int currentIndex;
  final scale;
  int indexNumber;

  CustomBottomNavigarBar(
      {super.key,
      required this.image,
      required this.onTap,
      this.scale,
      required this.currentIndex,
      required this.indexNumber});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              "$image",
              scale: scale ?? 3.0,
              color: lightBlueColor,
              // color: indexNumber == currentIndex ? gradient1 : gradient1,
            )),
      ),
    );
  }
}
