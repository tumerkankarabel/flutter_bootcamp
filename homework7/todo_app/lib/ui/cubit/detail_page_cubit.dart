import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/repo/todosdao_repository.dart';

class DetailPageCubit extends Cubit<void> {
  DetailPageCubit() : super(0);

  var trepo = TodosDaoRepository();

  Future<void> update(int todoId, String todoName) async {
    await trepo.update(todoId, todoName);
  }
}
