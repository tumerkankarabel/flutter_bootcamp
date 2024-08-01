import 'package:food_ordering_app/data/entity/cart_food.dart';

class SepetYemeklerResponse {
  List<SepetYemekler> cartFoods;
  int success;

  SepetYemeklerResponse({required this.cartFoods, required this.success});

  factory SepetYemeklerResponse.fromJson(Map<String, dynamic> json) {
    var jsonArray = json['sepet_yemekler'] as List? ?? [];
    int success = json['success'] as int; 

    var cartFoodList = jsonArray.map((jsonArrayObject) => SepetYemekler.fromJson(jsonArrayObject)).toList();

    return SepetYemeklerResponse(cartFoods: cartFoodList, success: success);
  }
}