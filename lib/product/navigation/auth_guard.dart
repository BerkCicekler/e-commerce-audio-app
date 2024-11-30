part of 'app_router.dart';

final class _AuthGuard extends AutoRouteGuard {
  _AuthGuard() {
    authManagerBloc = GetIt.I<AuthManagerBloc>();
  }

  late final AuthManagerBloc authManagerBloc;
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authManagerBloc.state is AuthManagerSuccessState ||
        resolver.routeName == AuthRoute.name) {
      resolver.next();
    } else {
      resolver.next(false);
      resolver.redirect(const AuthRoute());
    }
  }
}
