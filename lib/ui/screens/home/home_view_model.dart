import 'package:get/get.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/services/auth_serives.dart';
import 'package:pickmed/core/services/local_storage.dart';
import 'package:pickmed/locator.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_screen.dart';

class HomeViewModel extends BaseViewModel {
  final authService = locator<AuthServices>();
  final _localStorageService = locator<LocalStorageService>();

  logout() {
    _localStorageService.accessToken = null;
    Get.offAll(SignInScreen());
  }
}
