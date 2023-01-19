part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {}

class UserErrorState extends UserState {
  final String message;
  const UserErrorState(this.message);
}

// data loaded state
class UserLoadedState extends UserState {
  const UserLoadedState(this.users);
  final List<UserModel> users;
  @override
  List<Object> get props => [users];
}
