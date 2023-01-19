import 'package:flutter/material.dart';
import '../../blocs/export_bloc.dart';
import '../../widgets/my_drawer.dart';

class CounterCubitObserver extends Cubit<int> {
  // CounterCubit(super.initialState);
  CounterCubitObserver({this.initialData = 0}) : super(initialData);

  int initialData = 0;
  int? current;
  int? next;

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }

  // Observer
  // onChange
  // onError
  // Block Fitur untuk memantau
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    // print(change);
    current = change.currentState;
    next = change.nextState;
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    // print(error);
  }
}

// ignore: must_be_immutable
class KuldiObserverScreen extends StatelessWidget {
  KuldiObserverScreen({super.key});

  static const id = "kuldi-observer-screen";

  CounterCubitObserver myCounter = CounterCubitObserver();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Observer'),
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
                return Column(
                  children: [
                    Text(
                      '${snapshot.data}',
                      style: const TextStyle(fontSize: 50),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Current Data ${myCounter.current}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Next Data ${myCounter.next}',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  myCounter.kurangData();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  myCounter.tambahData();
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
