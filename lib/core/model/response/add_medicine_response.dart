// ignore_for_file: unnecessary_this, use_super_parameters

import 'package:pickmed/core/model/medicine.dart';
import 'package:pickmed/core/model/response/base_response.dart';

class MedicineResponse extends ApiBaseResponse {
  List<Medicine> resp = [];

  /// Default constructor
  MedicineResponse(succes, {error, required this.resp})
      : super(succes, error: error);

  /// Named Constructor
  MedicineResponse.fromJson(json) : super.fromJson(json) {
    if (json['medicines'] != null) {
      for (var med in json['medicines']) {
        resp.add(Medicine.fromJson(med));
      }
    }
  }
  MedicineResponse.fromJson2(json) : super.fromJson(json) {
    if (json['medicines'] != null) {
      for (var med in json['medicines']) {
        resp.add(Medicine.fromJson2(med));
      }
    }
  }
}
