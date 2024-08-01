import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/data/entity/food.dart';
import 'package:food_ordering_app/data/repo/food_dao_repository.dart';

class HomeScreenCubit extends Cubit<List<Yemekler>> {
  HomeScreenCubit() : super(<Yemekler>[]);

  var frepo = FoodDaoRepository();

  Future<void> getAllFoods() async {
    var list = await frepo.getAllFoods();
    emit(list);
  }

  Future<void> searchFoods(String searchTerm) async {
    var list = await frepo.searchFoods(searchTerm);
    emit(list);
  }
}