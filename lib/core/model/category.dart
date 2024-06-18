class Category {
  String? sId;
  String? category;
  int? iV;

  Category({this.sId, this.category, this.iV});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['category'] = category;
    data['__v'] = iV;
    return data;
  }
}
