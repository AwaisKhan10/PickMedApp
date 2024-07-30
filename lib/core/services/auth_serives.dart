// ignore_for_file: avoid_print, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:pickmed/core/model/body/login_body.dart';
import 'package:pickmed/core/model/body/signup_body.dart';
import 'package:pickmed/core/model/clinic_staff.dart';
import 'package:pickmed/core/model/response/auth_response.dart';
import 'package:pickmed/core/model/user_profile.dart';
import 'package:pickmed/core/services/api_services.dart';
import 'package:pickmed/core/services/data_base_services.dart';
import 'package:pickmed/core/services/local_storage.dart';
import 'package:pickmed/locator.dart';

import '../model/response/user_profile_response.dart';

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
  final _dbService = DatabaseService();
  final _localStorageService = locator<LocalStorageService>();
  UserProfile userProfile = UserProfile();
  String? fcmToken;
  ClinicStaff clinicStaff = ClinicStaff();

  doSetup() async {
    isLogin = _localStorageService.accessToken != null;
    if (isLogin) {
      debugPrint('User is already logged-in');
      await _getUserProfile();
      // await _updateFcmToken();
    } else {
      debugPrint('User is not logged-in');
    }
  }

  _getUserProfile() async {
    print("User ID: ${_localStorageService.getUserid}");
    UserProfileResponse response =
        await _dbService.getUserProfile(_localStorageService.getUserid);
    debugPrint("Message: ${response.error}");
    if (response.success) {
      userProfile = response.userProfile ?? UserProfile();
      isLogin = true;
      debugPrint('Got User Data: ${userProfile.toJson()}');
    } else {
      isLogin = false;
    }
  }

  ///
  /// Sign Up
  ///
  signUpUser(SignUpBody signUpBody) async {
    final AuthResponse response;
    response = await _dbService.createAccount(signUpBody);

    if (response.success) {
      userProfile = response.userProfile ?? UserProfile();
      _localStorageService.accessToken = response.accessToken;
      _localStorageService.setUserid = response.userProfile!.id;
      // print(_localStorageService.accessToken);
      // final fcmToken = await locator<NotificationsService>().getFcmToken();
      // final deviceId = await DeviceInfoService().getDeviceId();
      // await getUserProfile();
      // await _updateFcmToken();
      // await _dbService.addFcmToken(deviceId, fcmToken!);
    }
    return response;
  }

  ///
  /// Sign Up
  ///
  loginUser(SignInBody signInBody) async {
    final AuthResponse response;
    response = await _dbService.loginWithEmailAndPassword(signInBody);

    if (response.success) {
      userProfile = response.userProfile ?? UserProfile();
      //  UserProfileResponse userProfileResponse = await _dbService.getUserProfile(response.)
      _localStorageService.accessToken = response.accessToken;
      _localStorageService.setUserid = response.userProfile!.id;

      // print(_localStorageService.accessToken);
      // final fcmToken = await locator<NotificationsService>().getFcmToken();
      // final deviceId = await DeviceInfoService().getDeviceId();
      // await getUserProfile();
      // await _updateFcmToken();
      // await _dbService.addFcmToken(deviceId, fcmToken!);
    }
    return response;
  }

  logout() {
    _localStorageService.accessToken = null;
    _localStorageService.setUserid = null;
  }
}
