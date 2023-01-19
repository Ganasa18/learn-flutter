// ignore_for_file: avoid_print

import 'package:lear_second_fetch_bloc/blocs/export_bloc.dart';

class CounterBuilderBloc extends Cubit<int> {
  CounterBuilderBloc({this.init = 0}) : super(init);
  int init;

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}
