import 'package:flutter/material.dart';

import '../../blocs/export_bloc.dart';
import '../../widgets/my_drawer.dart';

// ignore: must_be_immutable
class KuldiBlocConsumer extends StatelessWidget {
  KuldiBlocConsumer({super.key});
  static const id = 'kuldi_bloc_consumer';
  CounterBuilderBloc myCounter = CounterBuilderBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuldi Bloc Consumer'),
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            // Gabungan antaran builder dan listener (Tapi wajib menggunakan builder dan listener)
            child: BlocConsumer<CounterBuilderBloc, int>(
              bloc: myCounter,
              builder: (context, state) {
                return Text(
                  '$state',
                  style: const TextStyle(fontSize: 50),
                );
              },
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sudah Mencapai 10')),
                );
              },
              listenWhen: (previous, current) {
                // di jalankan saat mencapai 10
                if (current == 10) {
                  return true;
                } else {
                  return false;
                }
              },
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
