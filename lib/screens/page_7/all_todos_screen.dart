import 'package:flutter/material.dart';
import 'package:lear_second_fetch_bloc/cubits/cubit/todo_cubit.dart';
import 'package:lear_second_fetch_bloc/widgets/todo_tile.dart';

import '../../blocs/export_bloc.dart';
import '../../models/todo_cubit/todo_model.dart';

class AllTodosScreen extends StatelessWidget {
  const AllTodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TodoCubit.get(context);
        List<TodoModel>? todoList = [];

        for (var item in cubit.todoList!) {
          if (!item.isArchived && !item.isDone) {
            todoList.add(item);
          }
        }

        return todoList.isEmpty
            ? const Center(
                child: Text('Data Todo Is Empty'),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return TodoTile(todoModel: todoList[index]);
                },
              );
      },
    );
  }
}
