import 'package:pickmed/core/model/response/base_response.dart';

import '../user_profile.dart';

class AuthResponse extends ApiBaseResponse {
  String? accessToken;
  UserProfile? userProfile;

  /// Default constructor
  // ignore: use_super_parameters
  AuthResponse(succes, {error, this.accessToken, this.userProfile})
      : super(succes, error: error);

  /// Named Constructor
  AuthResponse.fromJson(json) : super.fromJson(json) {
    accessToken = json['token'];
    if (json['userData'] != null) {
      userProfile = UserProfile.fromJson(json['userData']);
    }
  }
}
