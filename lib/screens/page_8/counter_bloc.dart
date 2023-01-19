import 'package:flutter/material.dart';
// import 'package:lear_second_fetch_bloc/screens/export_screen.dart';

import '../../blocs/counter_bloc_dasar/counter.dart';
import '../../widgets/my_drawer.dart';

class CounterBloc extends StatefulWidget {
  const CounterBloc({super.key});

  static const id = 'counter_bloc_screen';

  @override
  State<CounterBloc> createState() => _CounterBlocState();
}

class _CounterBlocState extends State<CounterBloc> {
  CounterBlocStream bloc = CounterBlocStream();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Builder Learn'),
        // backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: bloc.output,
              initialData: bloc.counter,
              builder: (context, snapshot) => Text(
                'Angkat saat ini : ${snapshot.data} ',
                style: const TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      bloc.inputan.add('minus');
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      bloc.inputan.add('add');
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
