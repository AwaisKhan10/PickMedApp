// ignore_for_file: avoid_print, unused_field, prefer_final_fields

import 'package:pickmed/core/model/body/signup_body.dart';
import 'package:pickmed/core/model/response/auth_response.dart';
import 'package:pickmed/core/model/response/request_response.dart';
import 'package:pickmed/core/model/user_profile.dart';
import 'package:pickmed/core/services/api_services.dart';
import 'package:pickmed/core/services/data_base_services.dart';
import 'package:pickmed/core/services/local_storage.dart';
import 'package:pickmed/locator.dart';

///
/// [AuthService] class contains all authentication related logic with following
/// methods:
///
/// [doSetup]: This method contains all the initial authentication like checking
/// login status, onboarding status and other related initial app flow setup.
///
/// [signupWithEmailAndPassword]: This method is used for signup with email and password.
///
/// [logout]:
///

class AuthServices {
  ApiServices _apiServices = ApiServices();
  late bool isLogin;
  final _dbService = locator<DatabaseService>();
  final _localStorageService = locator<LocalStorageService>();
  UserProfile userProfile = UserProfile();
  String? fcmToken;

  ///
  /// Sign Up
  ///
  signUpUser(SignUpBody signUpBody) async {
    final AuthResponse response;
    response = await _dbService.createAccount(signUpBody);

    if (response.success) {
      userProfile = UserProfile.fromJson(signUpBody.toJson());
      _localStorageService.accessToken = response.accessToken;
      // print(_localStorageService.accessToken);
      // final fcmToken = await locator<NotificationsService>().getFcmToken();
      // final deviceId = await DeviceInfoService().getDeviceId();
      // await getUserProfile();
      // await _updateFcmToken();
      // await _dbService.addFcmToken(deviceId, fcmToken!);
    }
    return response;
  }
}
