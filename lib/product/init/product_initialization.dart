import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerceaudio/product/bloc/auth_manager_bloc/auth_manager_bloc.dart';
import 'package:ecommerceaudio/product/bloc/basket_bloc/basket_bloc.dart';
import 'package:ecommerceaudio/product/bloc/categories_cubit/categories_cubit.dart';
import 'package:ecommerceaudio/product/cache/refresh_token_cache.dart';
import 'package:ecommerceaudio/product/cache/search_history_cache.dart';
import 'package:ecommerceaudio/product/models/cache_models/refresh_token_cache_model.dart';
import 'package:ecommerceaudio/product/models/cache_models/search_history.dart';
import 'package:ecommerceaudio/product/services/auth_service.dart';
import 'package:ecommerceaudio/product/services/basket_service.dart';
import 'package:ecommerceaudio/product/services/categories_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

final class ProductInitialization {
  ProductInitialization._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _getItInits();
    await EasyLocalization.ensureInitialized();
    await _cacheInits();
    await _rememberMe();
  }

  static Future<void> _cacheInits() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [SearchHistorySchema, RefreshTokenCacheModelSchema],
      directory: dir.path,
    );
    SearchHistoryCache.initIsar(isar);
    RefreshTokenCache.initIsar(isar);
  }

  static void _getItInits() {
    GetIt.I.registerSingleton(AuthManagerBloc(authService: AuthService()));
    GetIt.I.registerSingleton(
      CategoriesCubit(
        categoriesService: CategoriesService(),
      ),
    );
    GetIt.I.registerSingleton(BasketBloc(basketService: BasketService()));
  }

  static Future<void> _rememberMe() async {
    final refreshToken = await RefreshTokenCache.instance.getRefreshToken();
    Logger().d(refreshToken);
    if (refreshToken == null || refreshToken.isEmpty) {
      return;
    }
    GetIt.I<AuthManagerBloc>().add(AuthRefreshTokenSignInEvent(refreshToken));
  }
}
