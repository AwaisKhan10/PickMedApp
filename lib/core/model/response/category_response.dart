import 'package:pickmed/core/model/category.dart';
import 'package:pickmed/core/model/response/base_response.dart';

class CategoryResponse extends ApiBaseResponse {
  List<Category> categories = [];

  CategoryResponse.fromJson(json) : super.fromJson(json) {
    if (json['category'] != null) {
      categories = json['category']
          .map<Category>((category) => Category.fromJson(category))
          .toList();
    }
  }
}
