import 'package:pickmed/core/others/base_view_model.dart';

class AddMedicineProvider extends BaseViewModel {
  String value = '';

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
}
