part of 'todo_cubit.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class SetCurrentIndexAppState extends TodoState {}

// ignore: camel_case_types
class setDateState extends TodoState {}

class GetBoxState extends TodoState {}

class AddTodoListState extends TodoState {}
