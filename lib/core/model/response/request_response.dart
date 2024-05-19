// ignore_for_file: unnecessary_this

class RequestResponse {
  late bool success;
  String? error;
  var data;

  RequestResponse(this.success, {this.error, this.data});

  RequestResponse.fromJson(json) {
    try {
      this.data = json;
      this.success = json.data["success"];
      this.error = json.data['message'];
    } catch (e) {
      print("errorRequestResponse => $e");
    }
  }

  toJson() {
    return {
      'success': this.success,
      'message': this.error,
      'body': this.data,
    };
  }
}
