import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/ui/cubit/add_task_page_cubit.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  var tfTodoName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task Page"),
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
                  context.read<AddTaskPageCubit>().add(tfTodoName.text);
                },
                child: const Text("ADD"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
