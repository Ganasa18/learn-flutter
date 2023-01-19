import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lear_second_fetch_bloc/models/models_export.dart';

import '../../blocs/export_bloc.dart';
import '../../cubits/cubit/todo_cubit.dart';

class AddTodoForm extends StatelessWidget {
  const AddTodoForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    var cubit = TodoCubit.get(context);
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Todo Details'),
          content: BlocBuilder<TodoCubit, TodoState>(
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: cubit.titleController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Title'),
                        hintText: 'Enter Title',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'hey bro dont leave empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: cubit.descriptionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Description'),
                        hintText: 'Enter Description',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'hey bro dont leave empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 14),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        maximumSize: Size.infinite,
                      ),
                      onPressed: () {
                        cubit.setDate(context);
                      },
                      icon: const Icon(Icons.date_range),
                      label: Text(
                        DateFormat.yMMMEd().format(
                          cubit.initalDate,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                cubit.clearController();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  cubit.addTodo(
                    TodoModel(
                      title: cubit.titleController.text,
                      description: cubit.descriptionController.text,
                      date: cubit.initalDate,
                      isDone: false,
                      isArchived: false,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        '${cubit.titleController.text} added',
                      ),
                    ),
                  );
                  Navigator.pop(context);
                  cubit.clearController();
                }
              },
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
