import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/data/repo/food_dao_repository.dart';

class DetailScreenCubit extends Cubit<void> {
  DetailScreenCubit() : super(0);

  var frepo = FoodDaoRepository();

  Future<void> addToCart(String foodName, String foodImageName, int foodPrice,
      int foodOrderQuantity, String username) async {
    await frepo.addToCart(foodName, foodImageName, foodPrice, foodOrderQuantity, username);
  }
}