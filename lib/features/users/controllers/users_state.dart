import 'package:depi/features/users/models/users_model.dart';

abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final List<UsersModel> users;

  UsersLoaded(this.users);
}

class UsersError extends UsersState {
  final String message;

  UsersError(this.message);
}
