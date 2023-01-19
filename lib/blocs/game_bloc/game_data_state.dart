// ignore_for_file: non_constant_identifier_names

part of 'game_data_bloc.dart';

abstract class GameDataState extends Equatable {
  const GameDataState();

  @override
  List<Object> get props => [];
}

class GameDataLoadingState extends GameDataState {}

class GameDataErrorState extends GameDataState {
  final String message;
  const GameDataErrorState(this.message);
}

class GameDataLoadedState extends GameDataState {
  const GameDataLoadedState(this.game_data);
  final List<GameModel> game_data;
  @override
  List<Object> get props => [game_data];
}
