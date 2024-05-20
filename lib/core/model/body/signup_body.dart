// ignore_for_file: unnecessary_this

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

  toJson() {
    return {
      'email': this.email,
      'password': this.password,
      'fullname': this.name,
      'address': this.address,
      'phoneno': this.phone,
    };
  }
}
