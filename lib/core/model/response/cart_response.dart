import 'package:pickmed/core/model/cart.dart';
import 'package:pickmed/core/model/response/base_response.dart';

class CartResponse extends ApiBaseResponse {
  String? message;
  List<Cart> cartItems = [];
  CartResponse.fromJson(json) : super.fromJson(json) {
    message = json['message'];
  }

  CartResponse.cartItemJson(json) : super.fromJson(json) {
    if (json['data'] != null) {
      if (json['data']['cartItems'].length > 0) {
        json['data']['cartItems'].forEach((v) {
          cartItems.add(Cart.fromJson(v));
        });
      }
    }
  }
}
