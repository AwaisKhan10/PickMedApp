// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class Medicine {
  String? title;
  String? id;
  String? categroy;
  String? price;
  String? description;

  Medicine({
    this.title,
    this.id,
    this.categroy,
    this.price,
    this.description,
    // this.fcmToken,
  });

  toJson() {
    return {
      'title': this.title,
      'id': this.id,
      'categroy': this.categroy,
      'price': this.price,
      'description': this.description,
    };
  }

  Medicine.fromJson(Map<String, dynamic> json) {
    try {
      this.id = json["id"];
      this.title = json["title"];
    } catch (e) {
      debugPrint("profile.FromJsonError => $e");
    }
  }
  Medicine.fromJson2(Map<String, dynamic> json) {
    try {
      this.id = json["id"];
      this.title = json["title"];
      this.categroy = json["categroy"];
      this.description = json["description"];
      this.price = json["price"];
    } catch (e) {
      debugPrint("profile.FromJsonError => $e");
    }
  }
}