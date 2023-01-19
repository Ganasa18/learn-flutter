// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lear_second_fetch_bloc/models/models_export.dart';
import 'package:lear_second_fetch_bloc/repository/api/game_repository.dart';

part 'game_data_event.dart';
part 'game_data_state.dart';

class GameDataBloc extends Bloc<GameDataEvent, GameDataState> {
  final GameRepository _repository;

  GameDataBloc(this._repository) : super(GameDataLoadingState()) {
    on<GameDataEvent>((event, emit) async {
      emit(GameDataLoadingState());
      try {
        final apiResult = await _repository.getGamesData();
        emit(GameDataLoadedState(apiResult!));
      } catch (e) {
        emit(GameDataErrorState(e.toString()));
      }
    });
  }
}
