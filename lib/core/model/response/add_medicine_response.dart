// // ignore_for_file: unnecessary_this, use_super_parameters

// import 'package:pickmed/core/model/response/base_response.dart';
// import 'package:pickmed/core/model/user_profile.dart';

// class MedicineResponse extends ApiBaseResponse {
//   UserProfile? userProfile;

//   /// Default constructor
//   MedicineResponse(succes, {error, this.userProfile})
//       : super(succes, error: error);

//   /// Named Constructor
//   MedicineResponse.fromJson(json) : super.fromJson(json) {
//     if (json['user'] != null) {
//       this.userProfile = UserProfile.fromJson(json["user"]);
//     }
//   }
// }
