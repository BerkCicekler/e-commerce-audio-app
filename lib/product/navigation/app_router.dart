import 'package:auto_route/auto_route.dart';
import 'package:ecommerceaudio/feature/auth_page/auth_page.dart';
import 'package:ecommerceaudio/feature/basket_page/basket_page.dart';
import 'package:ecommerceaudio/feature/filtered_results_page/filtered_results_page.dart';
import 'package:ecommerceaudio/feature/home_page/home_page.dart';
import 'package:ecommerceaudio/feature/product_page/product_page.dart';
import 'package:ecommerceaudio/feature/search_page/search_page.dart';
import 'package:ecommerceaudio/product/bloc/auth_manager_bloc/auth_manager_bloc.dart';
import 'package:ecommerceaudio/product/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

part 'app_router.gr.dart';
part 'auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
final class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page, initial: true, keepHistory: false),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ProductRoute.page),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: FilteredResultsRoute.page),
        AutoRoute(page: BasketRoute.page),
      ];

  //@override
  //List<AutoRouteGuard> get guards => [_AuthGuard()];
}
