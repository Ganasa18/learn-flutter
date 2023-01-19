import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:lear_second_fetch_bloc/cubits/cubit/todo_cubit.dart';
import 'package:lear_second_fetch_bloc/screens/export_screen.dart';
import '../../blocs/export_bloc.dart';
import '../../widgets/my_drawer.dart';
import 'add_todo_form.dart';

class TodoCubitHive extends StatelessWidget {
  const TodoCubitHive({super.key});
  static const id = 'todo_cubit_screen';

  @override
  Widget build(BuildContext context) {
    final List<Widget> screen = [
      const AllTodosScreen(),
      const DoneTodosScreen(),
      const ArchiveTodosScreen(),
    ];

    final formKey = GlobalKey<FormState>();
    final List<String> title = ["AllTodos", "Done", "Archives"];

    var cubit = TodoCubit.get(context);

    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title[cubit.currentIndex]),
            // backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          drawer: const MyDrawer(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.setBottomIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Done'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.archive), label: 'Archived'),
            ],
          ),
          body: screen[cubit.currentIndex],
          floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddTodoForm(formKey: formKey),
              );
            },
          ),
        );
      },
    );
  }
}
