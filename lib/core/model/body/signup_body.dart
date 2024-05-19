// ignore_for_file: unnecessary_this

import 'dart:io';

class SignUpBody {
  String? email;
  String? password;
  String? name;
  String? address;
  String? phone;

  SignUpBody({
    this.email,
    this.password,
    this.name,
    this.phone,
    this.address,
    // this.fcmToken,
  });

  toJson() async {
    return {
      'email': this.email,
      'password': this.password,
      'name': this.name,
      'address': this.address,
      'phone': this.phone,
    };
  }
}
