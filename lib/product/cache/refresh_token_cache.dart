import 'package:ecommerceaudio/product/models/cache_models/refresh_token_cache_model.dart';
import 'package:isar/isar.dart';

final class RefreshTokenCache {
  RefreshTokenCache._();

  static late final Isar _isar;
  static late final IsarCollection<RefreshTokenCacheModel>
      _refreshTokenCollection;

  static RefreshTokenCache instance = RefreshTokenCache._();

  static void initIsar(Isar isar) async {
    _isar = isar;
    _refreshTokenCollection = isar.refreshTokenCacheModels;
  }

  Future<void> updateRefreshToken(String val) async {
    await _isar.writeTxn(() async {
      await _refreshTokenCollection.delete(1);
      await _refreshTokenCollection
          .put(RefreshTokenCacheModel()..searchText = val);
    });
  }

  Future<String?> getRefreshToken() async {
    return (await _refreshTokenCollection.get(1))?.searchText;
  }
}
