class SignInBody {
  String? email;
  String? password;

  SignInBody({this.email, this.password});

  toJson() => {
        'email': email,
        'password': password,
      };
}
