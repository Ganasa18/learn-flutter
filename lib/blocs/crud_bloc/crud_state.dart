part of 'crud_bloc.dart';

class CrudState extends Equatable {
  const CrudState();

  @override
  List<Object> get props => [];
}

class CrudLoadingState extends CrudState {}

class CrudLoadedState extends CrudState {
  const CrudLoadedState(this.crud);
  final List<GaModel> crud;
  @override
  List<Object> get props => [crud];
}

class CrudErrorState extends CrudState {
  final String message;
  const CrudErrorState(this.message);
}
