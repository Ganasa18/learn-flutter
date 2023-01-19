import 'package:flutter/material.dart';

import '../../blocs/export_bloc.dart';
import '../../widgets/my_drawer.dart';

// ignore: must_be_immutable
class KuldiBlockListener extends StatelessWidget {
  KuldiBlockListener({super.key});
  static const id = 'kuldi_block_listener';

  CounterBuilderBloc myCounter = CounterBuilderBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuldi Bloc Listener'),
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocListener<CounterBuilderBloc, int>(
              // untuk melisten atau mendengar data yang ada di builder
              bloc: myCounter,
              listenWhen: (previous, current) {
                // di jalankan saat mencapai 10
                if (current == 10) {
                  return true;
                } else {
                  return false;
                }
              },
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sudah Mencapai 10')),
                );
              },
              child: BlocBuilder<CounterBuilderBloc, int>(
                bloc: myCounter,
                //build when jika akan merender nilai saat true sebaliknya tidak berlaku bila false
                buildWhen: (previous, current) {
                  // jika nilai 5 baru di tampilkan
                  if (current <= 10) {
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
            ),
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
