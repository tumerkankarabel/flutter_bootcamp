import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/repo/todosdao_repository.dart';

class AddTaskPageCubit extends Cubit<void> {
  AddTaskPageCubit() : super(0);

  var trepo = TodosDaoRepository();

  Future<void> add(String todoName) async {
    await trepo.add(todoName);
  }
}
