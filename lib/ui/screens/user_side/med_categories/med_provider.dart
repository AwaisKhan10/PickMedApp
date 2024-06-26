import 'package:get/get.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/medicine.dart';
import 'package:pickmed/core/model/response/add_medicine_response.dart';
import 'package:pickmed/core/model/response/cart_response.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/services/data_base_services.dart';
import 'package:pickmed/core/services/local_storage.dart';
import 'package:pickmed/locator.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_screen.dart';

class MedCategoriesProvider extends BaseViewModel {
  final db = DatabaseService();
  final _localStorageService = locator<LocalStorageService>();

  List<Medicine> medicins = [];

  MedCategoriesProvider(String name) {
    getbyCategory(name);
  }

  addToCart(String id) async {
    setState(ViewState.busy);
    CartResponse response = await db.addProductToCart(id);
    if (response.success == true) {
      Get.snackbar('Success', response.message ?? "Something went wrong");
    } else {
      Get.snackbar('Error', 'Error occured');
    }
    setState(ViewState.idle);
    notifyListeners();
  }

  getbyCategory(String name) async {
    setState(ViewState.busy);
    MedicineResponse response = await db.getMadicinbycategory(name);
    if (response.success == true && response.resp.isNotEmpty) {
      medicins = response.resp;
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

  logout() {
    _localStorageService.accessToken = null;
    Get.offAll(SignInScreen());
  }
}
