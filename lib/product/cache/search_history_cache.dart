import 'package:ecommerceaudio/product/models/cache_models/search_history.dart';
import 'package:isar/isar.dart';

/// This is a singleton manager class to
/// manage user's search histories
/// the initialization is being made in product_initialization.dart file
final class SearchHistoryCache {
  SearchHistoryCache._();

  static late final Isar _isar;
  static late final IsarCollection<SearchHistory> _searchCollection;

  static SearchHistoryCache instance = SearchHistoryCache._();

  static void initIsar(Isar isar) async {
    _isar = isar;
    _searchCollection = isar.searchHistorys;
  }

  Future<void> addNewSearch(String val) async {
    final isAlreadyExist =
        await _searchCollection.where().searchTextEqualTo(val).findAll();
    // if the value already searched before we are deleting that value
    if (isAlreadyExist.isNotEmpty) {
      remove(isAlreadyExist[0]);
    } else if (await _searchCollection.count() >= 10) {
      final all = await _searchCollection.where().findAll();
      remove(all[0]);
    }
    _isar.writeTxn(() async {
      _searchCollection.put(SearchHistory()..searchText = val);
    });
  }

  Future<void> remove(SearchHistory model) async {
    _isar.writeTxn(() async {
      _searchCollection.delete(model.id);
    });
  }

  Stream<List<SearchHistory>> listenCollectionStream() async* {
    yield* _searchCollection.where().watch(fireImmediately: true);
  }
}
