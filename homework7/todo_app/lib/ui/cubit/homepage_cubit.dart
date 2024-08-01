import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/todos.dart';
import 'package:todo_app/data/repo/todosdao_repository.dart';

class HomePageCubit extends Cubit<List<Todos>> {
  HomePageCubit() : super(<Todos>[]);

  var trepo = TodosDaoRepository();

  Future<void> loadTodos() async {
    var list = await trepo.loadTodos();
    emit(list);
  }

  Future<void> search(String searchingWord) async {
    var list = await trepo.search(searchingWord);
    emit(list);
  }

  Future<void> delete(int todoId) async {
    await trepo.delete(todoId);
    await loadTodos();
  }
}
