// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class UserProfile {
  String? id;
  String? email;
  String? fullName;
  String? password;
  String? address;
  String? phoneNumber;
  UserProfile({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.password,
    this.address,
  });

  UserProfile.fromJson(Map<String, dynamic> json) {
    try {
      this.email = json["email"];
      this.fullName = json["fullname"];
      this.phoneNumber = json["phoneno"];
      this.address = json["address"];
      this.id = json["_id"];
    } catch (e) {
      debugPrint("profile.FromJsonError => $e");
    }
  }

  // Future<Map<String, dynamic>> toJson() async {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['firstName'] = this.firstName;
  //   data['email'] = this.email;
  //   data['lastName'] = this.lastName;
  //   // data['fcmToken'] = this.fcmToken;
  //   data['goal'] = this.goal;
  //   data['exerciseTime'] = this.exerciseTime;
  //   data['photo'] = this.image == null
  //       ? null
  //       : await dio.MultipartFile.fromFile(this.image!.path);

  //   return data;
  // }

  toJson() {
    return {
      "email": email,
      "fullname": fullName,
      "phoneno": phoneNumber,
      "address": address,
      "password": password
    };
  }

  // deepCopy() {
  //   return UserProfile(
  //     firstName: this.firstName,
  //     email: this.email,
  //     lastName: this.lastName,
  //     goal: this.goal,
  //     imgUrl: this.imgUrl,
  //     exerciseTime: this.exerciseTime,
  //   );
  // }
}
