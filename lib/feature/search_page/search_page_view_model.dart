part of 'search_page.dart';

final class _SearchViewModel extends ChangeNotifier {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void onSearchSubmit(String val, BuildContext context) {
    if (val.isEmpty) {
      return;
    }
    context.router.push(FilteredSearchRoute(searchText: val));
    SearchHistoryCache.instance.addNewSearch(val);
  }

  void onSearchHistoryTap(SearchHistory model, BuildContext context) {
    _searchController.text = model.searchText!;
    onSearchSubmit(model.searchText!, context);
  }

  void onSearchRemove(SearchHistory model) {
    SearchHistoryCache.instance.remove(model);
  }
}
