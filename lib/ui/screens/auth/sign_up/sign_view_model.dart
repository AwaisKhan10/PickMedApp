import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/body/signup_body.dart';
import 'package:pickmed/core/model/response/auth_response.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/services/auth_serives.dart';
import 'package:pickmed/locator.dart';
import 'package:pickmed/ui/screens/root/root_screen.dart';

class SignUpViewModel extends BaseViewModel {
  final fmkey = GlobalKey<FormState>();
  // AppUser appUser = AppUser();
  final authServices = locator<AuthServices>();
  late AuthResponse authResponse;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SignUpBody signUpBody = SignUpBody();

  signUp(BuildContext context) async {
    setState(ViewState.busy);
    authResponse = await authServices.signUpUser(signUpBody);
    setState(ViewState.idle);

    if (authResponse.success) {
      Get.offAll(() => const RootScreen());
    } else {
      Get.snackbar("Error!", "${authResponse.error}",
          colorText: blueColor, backgroundColor: blackColor);
    }
  }
}
