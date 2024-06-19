class ClinicStaff {
  String? sId;

  ClinicStaff({this.sId});

  ClinicStaff.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;

    return data;
  }
}
