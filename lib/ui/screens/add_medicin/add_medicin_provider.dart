import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/medicine.dart';
import 'package:pickmed/core/model/response/base_response.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/services/data_base_services.dart';

class AddMedicineProvider extends BaseViewModel {
  String value = '';
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
    'antihistamine/allergy',
    'antacids',
    'cough/cold medicines',
    'digestive aids',
    'others',
  ];

  selecttype(val) {
    value = val;
    notifyListeners();
  }

  addMedicine() async {
    if (value == items.first || value.isEmpty) {
      Get.snackbar('Alert!!', 'category must be selected');
    } else {
      setState(ViewState.busy);
      medicine.categroy = value;
      res = await db.addMedicin(medicine);
      if (res.success == true) {
        Get.snackbar('Success', 'Medicine added successfully');
        Get.back();
      } else {
        Get.snackbar('Error!!', 'Error occured');
        setState(ViewState.idle);
      }
      setState(ViewState.idle);

      notifyListeners();
    }
  }
}
