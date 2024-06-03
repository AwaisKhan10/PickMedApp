// ignore_for_file: unnecessary_this

class Medicine {
  String? title;
  String? categroy;
  String? price;
  String? description;

  Medicine({
    this.title,
    this.categroy,
    this.price,
    this.description,
    // this.fcmToken,
  });

  toJson() {
    return {
      'title': this.title,
      'categroy': this.categroy,
      'price': this.price,
      'description': this.description,
    };
  }
}
