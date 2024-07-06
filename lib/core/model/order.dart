class Orders {
  String? sId;
  String? fullname;
  int? price;
  String? orderStatus;
  int? iV;

  Orders({this.sId, this.fullname, this.price, this.orderStatus, this.iV});

  Orders.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullname = json['fullname'];
    price = json['price'];
    orderStatus = json['order_status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fullname'] = fullname;
    data['price'] = price;
    data['order_status'] = orderStatus;
    data['__v'] = iV;
    return data;
  }
}
