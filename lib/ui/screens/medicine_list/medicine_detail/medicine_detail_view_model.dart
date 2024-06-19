import 'package:get/get.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/response/cart_response.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/services/data_base_services.dart';

class MedicineDetailViewModel extends BaseViewModel {
  final db = DatabaseService();

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
}
