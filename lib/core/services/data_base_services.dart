import 'package:pickmed/core/constants/app_end_points.dart';
import 'package:pickmed/core/model/body/login_body.dart';
import 'package:pickmed/core/model/body/signup_body.dart';
import 'package:pickmed/core/model/response/auth_response.dart';
import 'package:pickmed/core/model/response/request_response.dart';
import 'package:pickmed/core/services/api_services.dart';

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
