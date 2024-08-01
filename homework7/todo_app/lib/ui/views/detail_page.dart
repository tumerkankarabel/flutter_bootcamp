import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/todos.dart';
import 'package:todo_app/ui/cubit/detail_page_cubit.dart';

class DetailPage extends StatefulWidget {
  Todos todo;

  DetailPage({required this.todo});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var tfTodoName = TextEditingController();

  @override
  void initState() {
    super.initState();
    var todo = widget.todo;
    tfTodoName.text = todo.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfTodoName,
                decoration: const InputDecoration(hintText: "Todo Name"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<DetailPageCubit>().update(widget.todo.id, widget.todo.name);
                },
                child: const Text("UPDATE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
