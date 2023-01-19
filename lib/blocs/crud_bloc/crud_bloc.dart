// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../blocs/export_bloc.dart';
import '../../models/models_export.dart';
import '../../repository/crud/crud_repository.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  final CrudRepository repository;
  CrudBloc(this.repository) : super(CrudLoadingState()) {
    on<CrudLoadEvent>(_onGetArea);
    // on<CrudLoadEvent>(_onCreateArea);
  }

  void _onGetArea(CrudLoadEvent event, Emitter<CrudState> emit) async {
    emit(CrudLoadingState());
    try {
      final apiResult = await repository.getAreaGa();
      emit(CrudLoadedState(apiResult!));
    } catch (e) {
      emit(CrudErrorState(e.toString()));
    }
  }

  // void _onCreateArea(CrudLoadEvent event, Emitter<CrudState> emit) async {
  //   emit(CrudLoadingState());
  //   try {
  //     // final apiResult = await repository.getAreaGa();
  //     // emit(CrudLoadedState(apiResult!));
  //   } catch (e) {
  //     emit(CrudErrorState(e.toString()));
  //   }
  // }
}
