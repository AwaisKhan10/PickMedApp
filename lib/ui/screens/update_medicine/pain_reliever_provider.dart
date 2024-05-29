import 'package:pickmed/core/model/medicine_type.dart';
import 'package:pickmed/core/others/base_view_model.dart';

class PainRelieverProvider extends BaseViewModel {
  List<MedicineType> medicinelist = [
    MedicineType(imgUrl: 'img2', medicineName: 'Cap. Celebrex', price: '40.00'),
    MedicineType(imgUrl: 'img1', medicineName: 'Cap. Tramadol', price: '20.00'),
    MedicineType(
        imgUrl: 'img3', medicineName: 'Tab.  Ibuprofen', price: '10.00'),
    MedicineType(imgUrl: 'img2', medicineName: 'Cap. Celebrex', price: '40.00'),
    MedicineType(imgUrl: 'img1', medicineName: 'Cap. Tramadol', price: '20.00'),
  ];
}
