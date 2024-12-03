part of 'search_page.dart';

final class _SearchViewModel extends ChangeNotifier {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void onSearchSubmit(String val) {
    SearchHistoryCache.instance.addNewSearch(val);
  }

  void onSearchHistoryTap(SearchHistory model) {
    _searchController.text = model.searchText!;
    onSearchSubmit(model.searchText!);
  }

  void onSearchRemove(SearchHistory model) {
    SearchHistoryCache.instance.remove(model);
  }
}
