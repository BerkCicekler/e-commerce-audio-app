import 'package:isar/isar.dart';

part 'refresh_token_cache_model.g.dart';

@collection
final class RefreshTokenCacheModel {
  final Id id = 1;

  @Index(type: IndexType.value)
  String? searchText;
}
