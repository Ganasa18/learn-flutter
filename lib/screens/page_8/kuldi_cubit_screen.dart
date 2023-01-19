import 'package:flutter/material.dart';

import '../../blocs/export_bloc.dart';
import '../../widgets/my_drawer.dart';

class CounterCubit extends Cubit<int> {
  // CounterCubit(super.initialState);
  CounterCubit({this.initialData = 0}) : super(initialData);

  int initialData = 0;

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }
}

// ignore: must_be_immutable
class KuldiCubitScreen extends StatelessWidget {
  KuldiCubitScreen({super.key});

  CounterCubit myCounter = CounterCubit();

  static const id = "kuldi-cubit-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Dasar'),
        // backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: StreamBuilder(
                initialData: myCounter.initialData,
                stream: myCounter.stream,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: const TextStyle(fontSize: 50),
                  );
                  // Karena ada initialData tidak perlu waiting
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return const Text(
                  //     'Loading...',
                  //     style: TextStyle(fontSize: 50),
                  //   );
                  // } else {
                  //   return Text(
                  //     '${snapshot.data}',
                  //     style: const TextStyle(fontSize: 50),
                  //   );
                  // }
                }),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    myCounter.kurangData();
                  },
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    myCounter.tambahData();
                  },
                  icon: const Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
