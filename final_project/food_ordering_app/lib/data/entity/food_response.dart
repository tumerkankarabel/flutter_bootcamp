import 'package:food_ordering_app/data/entity/food.dart';

class YemeklerResponse {
  List<Yemekler> food;
  int success;

  YemeklerResponse({required this.food, required this.success});

  factory YemeklerResponse.fromJson(Map<String, dynamic> json) {
    var jsonArray = json['yemekler'] as List;
    int success = json['success'] as int;

    var foodList = jsonArray.map((jsonArrayObject) => Yemekler.fromJson(jsonArrayObject)).toList();

    return YemeklerResponse(food: foodList, success: success);
  }
}