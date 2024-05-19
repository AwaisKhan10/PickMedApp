// ignore_for_file: unnecessary_this, use_super_parameters

import 'package:pickmed/core/model/response/base_response.dart';

class AuthResponse extends ApiBaseResponse {
  String? accessToken;

  /// Default constructor
  AuthResponse(succes, {error, this.accessToken}) : super(succes, error: error);

  /// Named Constructor
  AuthResponse.fromJson(json) : super.fromJson(json) {
    if (json['body'] != null) {
      this.accessToken = json['accessToken'];
    }
  }
}
