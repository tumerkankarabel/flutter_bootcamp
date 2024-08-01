import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/data/entity/cart_food.dart';
import 'package:food_ordering_app/data/repo/food_dao_repository.dart';

class CartScreenCubit extends Cubit<List<SepetYemekler>> {
  CartScreenCubit() : super(<SepetYemekler>[]);

  var frepo = FoodDaoRepository();

  Future<void> getCartFoods(String username) async {
    var list = await frepo.getCartFoods(username);
    emit(list);
  }

  Future<void> deleteFromCart(int cartFoodId, String username) async {
    await frepo.deleteFromCart(cartFoodId, username);
    await getCartFoods(username);
  }
}