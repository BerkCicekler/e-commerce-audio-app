import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerceaudio/product/bloc/auth_manager_bloc/auth_manager_bloc.dart';
import 'package:ecommerceaudio/product/bloc/categories_cubit/categories_cubit.dart';
import 'package:ecommerceaudio/product/services/auth_service.dart';
import 'package:ecommerceaudio/product/services/categories_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

final class ProductInitialization {
  ProductInitialization._();

  static Future<void> Init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _getItInits();
    await EasyLocalization.ensureInitialized();
  }

  static void _getItInits() {
    GetIt.I.registerSingleton(AuthManagerBloc(authService: AuthService()));
    GetIt.I.registerSingleton(
      CategoriesCubit(
        categoriesService: CategoriesService(),
      ),
    );
  }
}
