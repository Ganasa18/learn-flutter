import 'package:flutter/material.dart';
import 'package:lear_second_fetch_bloc/screens/export_screen.dart';
// import 'package:lear_second_fetch_bloc/screens/page_2/reusable_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                color: Colors.grey,
                child: Text(
                  'Drawer',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              // ignore: prefer_const_constructors
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(HomeScreen.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.home,
                  ),
                  title: Text('My Home'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(ReusableCompScreen.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.home,
                  ),
                  title: Text('Reusable Widget Screen'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(GameScreen.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.gamepad,
                  ),
                  title: Text('Game Data Screen'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(CrudScreen.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.folder,
                  ),
                  title: Text('Screen Crud'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(CounterBloc.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.folder,
                  ),
                  title: Text('Screen Bloc Counter'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(CounterBlocProviderScreen.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.folder,
                  ),
                  title: Text('Screen Bloc Flutter'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(KuldiCubitScreen.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.folder,
                  ),
                  title: Text('Cubit Dasar Kuldi'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(KuldiObserverScreen.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.folder,
                  ),
                  title: Text('Cubit Observer Kuldi'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(KuldiBlockBuilder.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.folder,
                  ),
                  title: Text('Bloc Builder Kuldi'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(KuldiBlockListener.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.folder,
                  ),
                  title: Text('Bloc Listener Kuldi'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(KuldiBlocConsumer.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.folder,
                  ),
                  title: Text('Bloc Consumer Kuldi'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(CircularSliderScreen.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.folder,
                  ),
                  title: Text('Screen Circular Slider'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(ConcentricPageScreen.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.folder,
                  ),
                  title: Text('Concentric Page Lottie'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(MyFakerScreen.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.folder,
                  ),
                  title: Text('Faker Screen'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(TodoCubitHive.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.folder,
                  ),
                  title: Text('Todo Cubit Hive'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(HomePageNike.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.folder,
                  ),
                  title: Text('Home Page Nike UI'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(FlChartPage.id);
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.folder,
                  ),
                  title: Text('Home Page FL Chart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
