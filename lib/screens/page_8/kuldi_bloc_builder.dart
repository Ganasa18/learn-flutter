import 'package:flutter/material.dart';
// import 'package:lear_second_fetch_bloc/blocs/counter_builder_bloc/counter_builder_bloc.dart';

import '../../blocs/export_bloc.dart';
import '../../widgets/my_drawer.dart';

// ignore: must_be_immutable
class KuldiBlockBuilder extends StatelessWidget {
  KuldiBlockBuilder({super.key});
  static const id = 'kuldi-block-builder';

  CounterBuilderBloc myCounter = CounterBuilderBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuldi Bloc Builder'),
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            // BlocBuilder // BlocBuilder<CounterBuilderBloc, int>
            child: BlocBuilder<CounterBuilderBloc, int>(
              bloc: myCounter,
              //build when jika akan merender nilai saat true sebaliknya tidak berlaku bila false
              buildWhen: (previous, current) {
                // jika nilai 5 baru di tampilkan
                if (current == 5) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                return Text(
                  '$state',
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
            // child: StreamBuilder<Object>(
            //   initialData: myCounter.init,
            //   stream: myCounter.stream,
            //   builder: (context, snapshot) {
            //     return Text(
            //       '${snapshot.data}',
            //       style: const TextStyle(fontSize: 50),
            //     );
            //   },
            // ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  myCounter.decrement();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  myCounter.increment();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
