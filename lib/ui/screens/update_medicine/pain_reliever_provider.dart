import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/medicine.dart';

import 'package:pickmed/core/model/response/add_medicine_response.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/services/data_base_services.dart';

class PainRelieverProvider extends BaseViewModel {
  final db = DatabaseService();
  MedicineResponse? response;
  List<Medicine> medicins = [];

  PainRelieverProvider(String name) {
    getbyCategory(name);
  }

  getbyCategory(String name) async {
    setState(ViewState.busy);
    response = await db.getMadicinbycategory(name);
    if (response!.success == true && response != null) {
      medicins = response!.resp;
    }
    setState(ViewState.idle);
  }

  deleteMed(id, index) async {
    setState(ViewState.busy);
    await db.deleteMedicine(id);
    medicins.removeAt(index);
    setState(ViewState.idle);
  }

  // List<MedicineType> medicinelist = [
  //   MedicineType(imgUrl: 'img2', medicineName: 'Cap. Celebrex', price: '40.00'),
  //   MedicineType(imgUrl: 'img1', medicineName: 'Cap. Tramadol', price: '20.00'),
  //   MedicineType(
  //       imgUrl: 'img3', medicineName: 'Tab.  Ibuprofen', price: '10.00'),
  //   MedicineType(imgUrl: 'img2', medicineName: 'Cap. Celebrex', price: '40.00'),
  //   MedicineType(imgUrl: 'img1', medicineName: 'Cap. Tramadol', price: '20.00'),
  // ];
}
