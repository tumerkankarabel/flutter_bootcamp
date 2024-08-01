import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:food_ordering_app/data/entity/cart_food.dart';
import 'package:food_ordering_app/data/entity/cart_food_response.dart';
import 'package:food_ordering_app/data/entity/food.dart';
import 'package:food_ordering_app/data/entity/food_response.dart';

class FoodDaoRepository {
  List<Yemekler> parseFoods(String response) {
    return YemeklerResponse.fromJson(json.decode(response)).food;
  }

  List<SepetYemekler> parseCartFoods(String response) {
    return SepetYemeklerResponse.fromJson(json.decode(response)).cartFoods;
  }

  Future<void> addToCart(String foodName, String foodImageName,
      int foodPrice, int foodOrderQuantity, String username) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";
    var data = {
      "yemek_adi": foodName,
      "yemek_resim_adi": foodImageName,
      "yemek_fiyat": foodPrice,
      "yemek_siparis_adet": foodOrderQuantity,
      "kullanici_adi": username,
    };
    var response = await Dio().post(url, data: FormData.fromMap(data));
    print("Yemek Kaydet : ${response.data.toString()}");
  }

  Future<List<SepetYemekler>> getCartFoods(String username) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php";
    var data = {"kullanici_adi": username};
    var response = await Dio().post(url, data: FormData.fromMap(data));
    return parseCartFoods(response.data.toString());
  }

  Future<void> deleteFromCart(int cartFoodId, String username) async {
    var url = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php";
    var data = {
      "sepet_yemek_id": cartFoodId,
      "kullanici_adi": username
    };
    await Dio().post(url, data: FormData.fromMap(data));
  }

  Future<List<Yemekler>> getAllFoods() async {
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var response = await Dio().get(url);
    return parseFoods(response.data.toString());
  }

  Future<List<Yemekler>> searchFoods(String searchTerm) async {
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var response = await Dio().get(url);
    var foodList = parseFoods(response.data.toString());
    return foodList
        .where((food) =>
            food.yemek_adi.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
  }
}
