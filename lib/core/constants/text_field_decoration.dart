import 'package:flutter/material.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/constants/text_style.dart';

final authFieldDecoration = InputDecoration(
  hintText: "",
  hintStyle:
      style18.copyWith(color: texfieldColor, fontWeight: FontWeight.normal),
  focusColor: whiteColor,
  prefixIconColor: primaryColor,
  suffixIconColor: primaryColor,
  fillColor: whiteColor,
  filled: true,
  border: InputBorder.none,
  contentPadding: const EdgeInsets.all(15),
  enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xff828282), width: 0.6),
      borderRadius: BorderRadius.circular(15)),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xff828282), width: 0.6),
      borderRadius: BorderRadius.circular(15)),
  errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xff828282), width: 0.6),
      borderRadius: BorderRadius.circular(15)),
  disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xff828282), width: 0.6),
      borderRadius: BorderRadius.circular(15)),
  focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xff828282), width: 0.6),
      borderRadius: BorderRadius.circular(15)),
);
