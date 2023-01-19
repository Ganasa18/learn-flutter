import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lear_second_fetch_bloc/blocs/export_bloc.dart';
import 'package:lear_second_fetch_bloc/models/models_export.dart';
part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  static TodoCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  setBottomIndex(int index) {
    currentIndex = index;
    emit(SetCurrentIndexAppState());
  }

  // controller Todo
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  var initalDate = DateTime.now();
  setDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: initalDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((value) {
      if (value != null) {
        initalDate = value;
      }
      emit(setDateState());
    });
  }

// Todo List Get
  List<int>? keys = [];
  List<TodoModel>? todoList = [];

  getBox() async {
    var box = await Hive.openBox<TodoModel>('todos');
    keys = [];
    keys = box.keys.cast<int>().toList();
    todoList = [];

    for (var key in keys!) {
      todoList!.add(box.get(key)!);
    }
    box.close();
    emit(GetBoxState());
  }

//  Add New Todo
  addTodo(TodoModel todoModel) async {
    await Hive.openBox<TodoModel>('todos')
        .then((value) => value.add(todoModel))
        .then((value) => getBox());

    emit(AddTodoListState());
  }

// Update Todo
  updateTodo(TodoModel todoModel) async {
    await Hive.openBox<TodoModel>('todos').then(
      (value) {
        final Map<dynamic, TodoModel> todoMap = value.toMap();
        dynamic desiredKey;

        todoMap.forEach((key, value) {
          if (value.title == todoModel.title) {
            desiredKey = key;
          }
        });
        return value.put(desiredKey, todoModel);
      },
    ).then(
      (value) => getBox(),
    );
    emit(AddTodoListState());
  }

  // Delete Todo
  deleteTodo(TodoModel todoModel) async {
    await Hive.openBox<TodoModel>('todos').then(
      (value) {
        final Map<dynamic, TodoModel> todoMap = value.toMap();
        dynamic desiredKey;

        todoMap.forEach((key, value) {
          if (value.title == todoModel.title) {
            desiredKey = key;
          }
        });
        return value.delete(desiredKey);
      },
    ).then(
      (value) => getBox(),
    );
    emit(AddTodoListState());
  }

  clearController() {
    descriptionController.clear();
    titleController.clear();
  }
}
