import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/todos.dart';
import 'package:todo_app/ui/cubit/homepage_cubit.dart';
import 'package:todo_app/ui/views/add_task_page.dart';
import 'package:todo_app/ui/views/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                decoration: const InputDecoration(hintText: "Search"),
                onChanged: (searchingResult) {
                  context.read<HomePageCubit>().search(searchingResult);
                },
              )
            : const Text("Todos"),
        actions: [
          isSearching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                    });
                  },
                  icon: const Icon(Icons.clear),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
        ],
      ),
      body: BlocBuilder<HomePageCubit, List<Todos>>(
        builder: (context, todosList) {
          if (todosList.isNotEmpty) {
            return ListView.builder(
              itemCount: todosList.length,
              itemBuilder: (context, index) {
                var todo = todosList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  todo: todo,
                                ))).then((value) {
                      context.read<HomePageCubit>().loadTodos();
                    });
                  },
                  child: Card(
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  todo.name,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("Should ${todo.name} be deleted?"),
                                  action: SnackBarAction(
                                    label: "Yes",
                                    onPressed: () {
                                      context
                                          .read<HomePageCubit>()
                                          .delete(todo.id);
                                    },
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddTaskPage()))
              .then((value) {
            context.read<HomePageCubit>().loadTodos();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
