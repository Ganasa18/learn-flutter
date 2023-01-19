import 'package:flutter/material.dart';

import '../../blocs/export_bloc.dart';
import '../../cubits/cubit/todo_cubit.dart';
import '../../models/todo_cubit/todo_model.dart';
import '../../widgets/todo_tile.dart';

class ArchiveTodosScreen extends StatelessWidget {
  const ArchiveTodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TodoCubit.get(context);
        List<TodoModel>? todoList = [];

        for (var item in cubit.todoList!) {
          if (item.isArchived) {
            todoList.add(item);
          }
        }

        return todoList.isEmpty
            ? const Center(
                child: Text('Data Archived Empty'),
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
