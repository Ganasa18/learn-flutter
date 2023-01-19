import 'package:flutter/material.dart';
import 'package:lear_second_fetch_bloc/models/models_export.dart';
// import 'package:lear_second_fetch_bloc/repository/api/user_repository.dart';
import 'package:lear_second_fetch_bloc/widgets/my_drawer.dart';
import '../../blocs/export_bloc.dart';
import '../../widgets/list_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const MyDrawer(),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            context.read<UserBloc>().add(LoadUserEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserLoadedState) {
            // List userList = state.users;
            // inspect(userList);
            // return Center(
            //   child: Text('Data Loaded'),
            // );
            List<UserModel> userList = state.users;
            return ListUser(userList: userList);
          } else if (state is UserErrorState) {
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
