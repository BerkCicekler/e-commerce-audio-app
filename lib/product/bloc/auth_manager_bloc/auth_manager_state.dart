part of 'auth_manager_bloc.dart';

sealed class AuthManagerState {}

final class AuthManagerInitialState extends AuthManagerState {}

final class AuthManagerLoadingState extends AuthManagerState {}

final class AuthManagerErrorState extends AuthManagerState {
  AuthManagerErrorState(this.error);
  final String error;
}

final class AuthManagerSuccessState extends AuthManagerState {
  AuthManagerSuccessState(this.user);
  final User user;
}
