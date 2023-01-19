import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:lear_second_fetch_bloc/blocs/counter_bloc_flutter/counter_flutter.dart';
import 'package:lear_second_fetch_bloc/cubits/cubit/todo_cubit.dart';
import 'package:lear_second_fetch_bloc/models/models_export.dart';
import '../repository/api/game_repository.dart';
import '../repository/api/user_repository.dart';
import '../repository/crud/crud_repository.dart';
import 'blocs/export_bloc.dart';
import 'screens/export_screen.dart';
import 'services/app_router.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

const String todoBoxName = "todos";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox<TodoModel>(todoBoxName);
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(UserRepository()),
        ),
        BlocProvider(
          create: (context) => GameDataBloc(GameRepository()),
        ),
        BlocProvider(
          create: (context) => CrudBloc(CrudRepository()),
        ),
        BlocProvider(create: (context) => CounterBuilderBloc()),
        BlocProvider(create: (context) => TodoCubit()..getBox()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
