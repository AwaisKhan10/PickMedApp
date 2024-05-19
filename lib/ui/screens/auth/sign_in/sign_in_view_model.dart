import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickmed/core/others/base_view_model.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/enums/view_state.dart';
import '../../../../core/model/body/login_body.dart';
import '../../../../core/model/response/auth_response.dart';
import '../../../../core/services/auth_serives.dart';
import '../../../../locator.dart';
import '../../root/root_screen.dart';

class SignInViewModel extends BaseViewModel {
  bool isChecked = false;

  onClick() {
    isChecked = !isChecked;
    notifyListeners();
  }

  final fmkey = GlobalKey<FormState>();
  // AppUser appUser = AppUser();
  final authServices = locator<AuthServices>();
  late AuthResponse authResponse;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SignInBody signInBody = SignInBody();

  signUp(BuildContext context) async {
    setState(ViewState.busy);
    authResponse = await authServices.loginUser(signInBody);
    setState(ViewState.idle);
    if (authResponse.success) {
      Get.offAll(() => const RootScreen());
    } else {
      Get.snackbar("Error!", "${authResponse.error}",
          colorText: blueColor, backgroundColor: blackColor);
    }
  }
}
