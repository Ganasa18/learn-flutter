import 'package:lear_second_fetch_bloc/blocs/export_bloc.dart';
// import 'package:lear_second_fetch_bloc/screens/export_screen.dart';

class CounterBlocFlutter extends Bloc<String, int> {
  CounterBlocFlutter() : super(0);

  int _counter = 0;

  int get counter => _counter;

  // async* digunakan untuk streame sedangkan async untuk Future
  Stream<int> mapEventToState(event, Emitter emit) async* {
    if (event == 'add') {
      _counter++;
    } else {
      _counter--;
    }

    // return _counter;
    emit(_counter);
  }
}
