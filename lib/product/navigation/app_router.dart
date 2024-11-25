import 'package:auto_route/auto_route.dart';
import 'package:ecommerceaudio/feature/auth_page/auth_page.dart';
import 'package:ecommerceaudio/feature/home_page/home_page.dart';
import 'package:ecommerceaudio/product/bloc/auth_manager_bloc/auth_manager_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_router.gr.dart';
part 'auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
final class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
      ];
}
