// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lear_second_fetch_bloc/models/models_export.dart';
import '../../repository/api/user_repository.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  // ignore: unused_field
  final UserRepository _repository;

  UserBloc(this._repository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        // List<UserModel>? apiResult = await _repository.getUsers();
        final apiResult = await _repository.getUsers();
        emit(UserLoadedState(apiResult!));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
