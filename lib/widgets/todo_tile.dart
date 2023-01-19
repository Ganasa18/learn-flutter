import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lear_second_fetch_bloc/cubits/cubit/todo_cubit.dart';
import 'package:lear_second_fetch_bloc/models/models_export.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.todoModel});

  final TodoModel todoModel;

  @override
  Widget build(BuildContext context) {
    var cubit = TodoCubit.get(context);
    return ListTile(
      title: Row(
        children: [
          Text(todoModel.title),
          const Spacer(),
          IconButton(
            onPressed: () {
              cubit.deleteTodo(todoModel);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {
              cubit.updateTodo(
                TodoModel(
                  title: todoModel.title,
                  description: todoModel.description,
                  date: todoModel.date,
                  isDone: true,
                  isArchived: false,
                ),
              );
            },
            icon: const Icon(
              Icons.done,
              color: Colors.green,
            ),
          ),
          IconButton(
            onPressed: () {
              cubit.updateTodo(
                TodoModel(
                  title: todoModel.title,
                  description: todoModel.description,
                  date: todoModel.date,
                  isDone: false,
                  isArchived: false,
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.amber,
            ),
          ),
          IconButton(
            onPressed: () {
              cubit.updateTodo(
                TodoModel(
                  title: todoModel.title,
                  description: todoModel.description,
                  date: todoModel.date,
                  isDone: todoModel.isDone,
                  isArchived: true,
                ),
              );
            },
            icon: const Icon(
              Icons.book,
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todoModel.description),
            Text(
              DateFormat.yMMMEd().format(todoModel.date),
            ),
          ],
        ),
      ),
    );
  }
}
