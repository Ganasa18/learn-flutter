import 'package:flutter/material.dart';
import 'package:lear_second_fetch_bloc/widgets/add_form_crud.dart';
import 'package:lear_second_fetch_bloc/widgets/my_drawer.dart';

import '../../blocs/export_bloc.dart';
import '../../models/models_export.dart';
import '../../widgets/list_crud.dart';

class CrudScreen extends StatefulWidget {
  const CrudScreen({super.key});

  static const id = 'crud_screen';

  @override
  State<CrudScreen> createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Crud'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
      drawer: const MyDrawer(),
      body: BlocBuilder<CrudBloc, CrudState>(
        builder: (context, state) {
          if (state is CrudLoadingState) {
            context.read<CrudBloc>().add(CrudLoadEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CrudLoadedState) {
            List<GaModel> crud = state.crud;
            return BodyCrud(crud: crud);
          } else if (state is CrudErrorState) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}

void _addTask(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const AddCrudForm(),
      ),
    ),
  );
}
