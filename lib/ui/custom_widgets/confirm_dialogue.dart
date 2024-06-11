import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:pickmed/core/constants/colors.dart';

confirmDialogue(BuildContext context,
    {String? message, String? text, final confirm}) {
  CoolAlert.show(
    barrierDismissible: false,
    confirmBtnColor: primaryColor,
    backgroundColor: whiteColor,
    context: context,
    type: CoolAlertType.confirm,
    title: "Are you Sure?",
    text: "$message",
    onConfirmBtnTap: confirm,
  );
}