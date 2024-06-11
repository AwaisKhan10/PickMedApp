import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/medicine.dart';
import 'package:pickmed/core/model/response/base_response.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/services/data_base_services.dart';

class UpdateProvider extends BaseViewModel {
  String value = '';
  Medicine medicine = Medicine();
  ApiBaseResponse res = ApiBaseResponse(false);
  final db = DatabaseService();
  final formKey = GlobalKey<FormState>();

  UpdateProvider(id) {
    medicine.id = id;
    print('med id==> $id');
  }

  updateMadicine(context) async {
    setState(ViewState.busy);
    res = await db.updateMedicin(medicine);
    if (res.success == true) {
      Get.snackbar('Success', 'Medicine updated successfully');
      Navigator.pop(context);
    } else {
      Get.snackbar('Error!!', 'Error occured');
      setState(ViewState.idle);
    }

    notifyListeners();
  }
}
