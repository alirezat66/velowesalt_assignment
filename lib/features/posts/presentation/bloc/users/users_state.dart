part of 'users_cubit.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoadingFailed extends UsersState {
  final String error;
  UsersLoadingFailed(this.error);
}

class UsersLoaded extends UsersState {
  final List<UserEntity> users;
  UsersLoaded(this.users);
}
