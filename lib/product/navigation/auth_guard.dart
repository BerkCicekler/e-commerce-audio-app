part of 'app_router.dart';

final class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final context = router.navigatorKey.currentContext;
    if (context == null) {
      resolver.next(false);
      return;
    }

    final authManagerBloc = context.read<AuthManagerBloc>();
    if (authManagerBloc.state is AuthManagerSuccessState) {
      resolver.next();
    } else {
      resolver.next(false);
    }
  }
}
