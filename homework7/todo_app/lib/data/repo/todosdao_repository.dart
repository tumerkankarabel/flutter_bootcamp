import 'package:todo_app/data/entity/todos.dart';
import 'package:todo_app/sqlite/database_helper.dart';

class TodosDaoRepository {
  Future<void> add(String todoName) async {
    var db = await DatabaseHelper.accessDatabase();
    var newTodo = Map<String, dynamic>();
    newTodo["name"] = todoName;
    await db.insert("todos", newTodo);
  }

  Future<void> update(int todoId, String todoName) async {
    var db = await DatabaseHelper.accessDatabase();
    var updatedTodo = Map<String, dynamic>();
    updatedTodo["name"] = todoName;
    await db.update("todos", updatedTodo, where: "id = ?", whereArgs: [todoId]);
  }

  Future<void> delete(int todoId) async {
    var db = await DatabaseHelper.accessDatabase();
    await db.delete("todos", where: "id = ?", whereArgs: [todoId]);
  }

  Future<List<Todos>> loadTodos() async {
    var db = await DatabaseHelper.accessDatabase();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM todos");

    return List.generate(maps.length, (i) {
      var record = maps[i];
      return Todos(
        id: record["id"],
        name: record["name"],
      );
    });
  }

  Future<List<Todos>> search(String searchingWord) async {
    var db = await DatabaseHelper.accessDatabase();
    List<Map<String, dynamic>> maps = await db
        .rawQuery("SELECT * FROM todos WHERE name like '%$searchingWord%'");

    return List.generate(maps.length, (i) {
      var record = maps[i];
      return Todos(
        id: record["id"],
        name: record["name"],
      );
    });
  }
}
