import 'package:pickmed/core/others/base_view_model.dart';

class SignInViewModel extends BaseViewModel {
  bool isChecked = false;

  onClick() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
