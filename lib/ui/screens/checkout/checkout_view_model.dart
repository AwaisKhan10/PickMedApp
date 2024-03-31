import 'package:flutter/material.dart';
import 'package:pickmed/core/others/base_view_model.dart';

class CheckoutViewModel extends BaseViewModel {
  bool isTextFieldFocused = false;
  TextEditingController nameController =
      TextEditingController(text: 'User Name');
  TextEditingController PhoneController =
      TextEditingController(text: '013 - 456789');
}
