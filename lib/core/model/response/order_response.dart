import 'package:pickmed/core/model/order.dart';
import 'package:pickmed/core/model/response/base_response.dart';

class OrdersResponse extends ApiBaseResponse {
  List<Orders> orders = [];

  OrdersResponse.fromJson(json) : super.fromJson(json) {
    if (json['data'] != null) {
      orders = json['data']
          .map<Orders>((category) => Orders.fromJson(category))
          .toList();
    }
  }
}
