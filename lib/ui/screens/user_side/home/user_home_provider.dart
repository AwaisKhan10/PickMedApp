import 'package:get/get.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/category.dart';
import 'package:pickmed/core/model/response/category_response.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/services/auth_serives.dart';
import 'package:pickmed/core/services/data_base_services.dart';
import 'package:pickmed/core/services/local_storage.dart';
import 'package:pickmed/locator.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_screen.dart';

class UserHomeProvider extends BaseViewModel {
  final authService = locator<AuthServices>();
  final _localStorageService = locator<LocalStorageService>();
  final db = DatabaseService();
  List<Category> categroies = [];

  UserHomeProvider() {
    getCategory();
  }
  // List<String> cats = [
  //   'pain relievers',
  //   'anthistamine allergy',
  //   'antacids',
  //   'cough cold medicines',
  //   'digestive  aids',
  //   'others',
  // ];

  getCategory() async {
    setState(ViewState.busy);
    CategoryResponse response = await db.getCategories();
    if (response.success == true) {
      categroies = response.categories;
    }
    setState(ViewState.idle);
    notifyListeners();
  }

  logout() {
    _localStorageService.accessToken = null;
    Get.offAll(SignInScreen());
  }
}
