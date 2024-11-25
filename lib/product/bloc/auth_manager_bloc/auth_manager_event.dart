part of 'auth_manager_bloc.dart';

sealed class AuthPageEvent {}

final class AuthPageOnButtonClickEvent extends AuthPageEvent {
  AuthPageOnButtonClickEvent(
    this.userName,
    this.email,
    this.password,
    this.isSignIn,
  );

  final String userName;
  final String email;
  final String password;
  final bool isSignIn;
}

final class AuthPageOnOAuthSignInEvent extends AuthPageEvent {
  AuthPageOnOAuthSignInEvent(this.oAuthService);

  final IOAuthSignInService oAuthService;
}
