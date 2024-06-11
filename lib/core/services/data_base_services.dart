import 'dart:developer';

import 'package:pickmed/core/constants/app_end_points.dart';
import 'package:pickmed/core/model/body/login_body.dart';
import 'package:pickmed/core/model/body/signup_body.dart';
import 'package:pickmed/core/model/medicine.dart';
import 'package:pickmed/core/model/response/add_medicine_response.dart';
import 'package:pickmed/core/model/response/auth_response.dart';
import 'package:pickmed/core/model/response/request_response.dart';
import 'package:pickmed/core/model/response/user_profile_response.dart';
import 'package:pickmed/core/model/user_profile.dart';
import 'package:pickmed/core/services/api_services.dart';

import '../model/response/base_response.dart';

class DatabaseService {
  final ApiServices _apiServices = ApiServices();

  Future<AuthResponse> createAccount(SignUpBody body) async {
    final RequestResponse response = await _apiServices.postRequest(
      url: '${EndPoints.baseUrl}${EndPoints.sign_up}',
      data: body.toJson(),
    );

    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> loginWithEmailAndPassword(SignInBody body) async {
    final RequestResponse response = await _apiServices.postRequest(
      url: '${EndPoints.baseUrl}${EndPoints.sign_in}',
      data: body.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<UserProfileResponse> getUserProfile(String userid) async {
    final RequestResponse response = await _apiServices.getRequest(
        url: '${EndPoints.baseUrl}${EndPoints.getUserbyId}/$userid');
    return UserProfileResponse.fromJson(response.data);
  }

  Future<ApiBaseResponse> updateUser(
      String userid, UserProfile userProfile) async {
    final RequestResponse response = await _apiServices.putRequest(
        url: '${EndPoints.baseUrl}${EndPoints.updateUserbyId}/$userid',
        data: userProfile.toJson());
    return UserProfileResponse.fromJson(response.data);
  }

  Future<ApiBaseResponse> addMedicin(Medicine medicine) async {
    final RequestResponse response = await _apiServices.postRequest(
        url: '${EndPoints.baseUrl}${EndPoints.AddMedicine}',
        data: medicine.toJson());
    log('medicine response ==> $response');
    return ApiBaseResponse.fromJson(response.data);
  }
  Future<ApiBaseResponse> deleteMedicine(id) async {
    final RequestResponse response = await _apiServices.deleteRequest(
        url: '${EndPoints.baseUrl}medicine/delete/$id',);
    log('medicine response ==> $response');
    return ApiBaseResponse.fromJson(response.data);
  }

  Future<ApiBaseResponse> updateMedicin(Medicine medicine) async {
    final RequestResponse response = await _apiServices.putRequest(
        url: '${EndPoints.baseUrl}medicine/update/${medicine.id}',
        data: medicine.toJson2());
    log('medicine response ==> $response');
    return ApiBaseResponse.fromJson(response.data);
  }

  Future<MedicineResponse> getMadicins() async {
    final RequestResponse response = await _apiServices.getRequest(
        url: '${EndPoints.baseUrl}medicine/getAll-Medicines');
    log('medicine response ==> ${response.data}');
    return MedicineResponse.fromJson(response.data);
  }

  Future<MedicineResponse> getMadicinbycategory(cat) async {
    final RequestResponse response = await _apiServices.getRequest(
        url: '${EndPoints.baseUrl}medicine/category/$cat');
    log('medicine response ==> ${response.data}');
    return MedicineResponse.fromJson2(response.data);
  }

  // Future<AuthResponse> sendEmailOTP(String email) async {
  //   final RequestResponse response = await _apiServices.postRequest(
  //       url: '${EndPoints.baseUrl}${EndPoints.send_email_otp}',
  //       data: {
  //         "email": email,
  //       });

  //   return AuthResponse.fromJson(response.data);
  // }

  // Future<AuthResponse> verifyEmailOTP(VerifyEmailAddress verifyEmail) async {
  //   final RequestResponse response = await _apiServices.postRequest(
  //       url: '${EndPoints.baseUrl}${EndPoints.verify_email_otp}',
  //       data: verifyEmail.toJson());

  //   return AuthResponse.fromJson(response.data);
  // }

  // Future<AuthResponse> setNewPassword(SetNewPassword setNewPassword) async {
  //   final RequestResponse response = await _apiServices.postRequest(
  //       url: '${EndPoints.baseUrl}${EndPoints.set_new_password}',
  //       data: setNewPassword.toJson());

  //   return AuthResponse.fromJson(response.data);
  // }

  // Future<UserProfileResponse> completeProfile(
  //     CompleteUserProfile completeUserProfile) async {
  //   FormData formData =
  //       await FormData.fromMap(await completeUserProfile.toJson());

  //   final RequestResponse response = await _apiServices.postRequest(
  //     url: '${EndPoints.baseUrl}${EndPoints.complete_user_profile}',
  //     data: formData,
  //   );

  //   print("Profile completed ===> ${response.data.toString()}");
  //   return UserProfileResponse.fromJson(response.data);
  // }

  // Future<AuthResponse> resetPassword(ResetPasswordBody body) async {
  //   final RequestResponse response = await _apiServices.post(
  //     url: '${EndPoints.baseUrl}${EndPoints.reset_password}',
  //     data: body.toJson(),
  //   );
  //   return AuthResponse.fromJson(response.data);
  // }

  // Future<AuthResponse> updatePassword(UpdatePasswordBody body) async {
  //   final RequestResponse response = await _apiServices.post(
  //     url: '${EndPoints.baseUrl}${EndPoints.update_password}',
  //     data: body.toJson(),
  //   );
  //   return AuthResponse.fromJson(response.data);
  // }

  // Future<AuthResponse> verifyOTP(VerifyOTPBody body) async {
  //   final RequestResponse response = await _apiServices.post(
  //     url: '${EndPoints.baseUrl}${EndPoints.verify_otp}',
  //     data: body.toJson(),
  //   );
  //   return AuthResponse.fromJson(response.data);
  // }

  // Future<UserProfileResponse> getUserProfile() async {
  //   final RequestResponse response = await _apiServices.getRequest(
  //       url: '${EndPoints.baseUrl}${EndPoints.user_profile}');
  //   return UserProfileResponse.fromJson(response.data);
  // }
}
