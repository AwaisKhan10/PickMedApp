import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/medicine.dart';
import 'package:pickmed/core/model/response/base_response.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/services/data_base_services.dart';
import 'package:pickmed/core/services/file_picker_service.dart';
import 'package:pickmed/core/services/firebase_storage_service.dart';

class AddMedicineProvider extends BaseViewModel {
  String value = '';
  final storageService = FirebaseStorageService();
  final imagePicker = FilePickerService();
  File? image;
  Medicine medicine = Medicine();
  ApiBaseResponse res = ApiBaseResponse(false);
  final db = DatabaseService();
  final formKey = GlobalKey<FormState>();

  AddMedicineProvider() {
    value = items.first;
  }

  List<String> items = [
    'Select Type',
    'pain relievers',
    'anthistamine/allergy',
    'antacids',
    'cough/cold medicines',
    'digestive aids',
    'others',
  ];

  selecttype(val) {
    value = val;
    notifyListeners();
  }

  imagepicker() async {
    try {
      image = await imagePicker.pickSingleImage();
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  addMedicine(context) async {
    if (value == items.first || value.isEmpty) {
      Get.snackbar('Alert!!', 'category must be selected');
    } else {
      setState(ViewState.busy);
      medicine.categroy = value;
      if (image != null) {
        medicine.imageUrl =
            await storageService.uploadImage(image!, "medicines_images");
      }
      res = await db.addMedicin(medicine);
      if (res.success == true) {
        Get.snackbar('Success', 'Medicine added successfully');
        Navigator.pop(context);
      } else {
        Get.snackbar('Error!!', 'Error occured');
        setState(ViewState.idle);
      }
      setState(ViewState.idle);

      notifyListeners();
    }
  }
}
