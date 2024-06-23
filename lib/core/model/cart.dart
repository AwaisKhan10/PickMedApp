class Cart {
  String? sId;
  ProductId? productId;
  String? title;
  int? price;
  int? cartQuantity;
  int? subtotal;
  int? total;
  String? orderStatus;
  String? userId;
  int? iV;

  Cart(
      {this.sId,
      this.productId,
      this.title,
      this.price,
      this.cartQuantity,
      this.subtotal,
      this.total,
      this.orderStatus,
      this.userId,
      this.iV});

  Cart.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productId = json['product_id'] != null
        ? ProductId.fromJson(json['product_id'])
        : null;
    title = json['title'];
    price = json['price'];
    cartQuantity = json['cartQuantity'];
    subtotal = json['subtotal'];
    total = json['Total'];
    orderStatus = json['order_status'];
    userId = json['userId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (productId != null) {
      data['product_id'] = productId!.toJson();
    }
    data['title'] = title;
    data['price'] = price;
    data['cartQuantity'] = cartQuantity;
    data['subtotal'] = subtotal;
    data['Total'] = total;
    data['order_status'] = orderStatus;
    data['userId'] = userId;

    data['__v'] = iV;
    return data;
  }
}

class ProductId {
  String? sId;
  String? title;
  String? categroy;
  String? price;
  String? description;
  String? imageUrl;
  int? iV;

  ProductId(
      {this.sId,
      this.title,
      this.categroy,
      this.price,
      this.description,
      this.imageUrl,
      this.iV});

  ProductId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    categroy = json['categroy'];
    price = json['price'];
    description = json['description'];
    imageUrl = json['file'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['categroy'] = categroy;
    data['price'] = price;
    data['description'] = description;
    data['file'] = imageUrl;
    data['__v'] = iV;
    return data;
  }
}
