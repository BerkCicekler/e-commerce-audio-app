import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerceaudio/product/bloc/auth_manager_bloc/auth_manager_bloc.dart';
import 'package:ecommerceaudio/product/bloc/categories_cubit/categories_cubit.dart';
import 'package:ecommerceaudio/product/models/cache_models/search_history.dart';
import 'package:ecommerceaudio/product/services/auth_service.dart';
import 'package:ecommerceaudio/product/services/categories_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

final class ProductInitialization {
  ProductInitialization._();

  static Future<void> Init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _getItInits();
    await EasyLocalization.ensureInitialized();
    await _cacheInits();
  }

  static Future<void> _cacheInits() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [SearchHistorySchema],
      directory: dir.path,
    );
    GetIt.I.registerSingleton(isar);
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
