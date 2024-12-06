part of '../../filtered_results_page.dart';

mixin _ProductsMixin on State<_Products> {
  late final ScrollController _scrollController;
  late final FilteredSearchBloc _filteredSearchBloc;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _filteredSearchBloc = context.read<FilteredSearchBloc>();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _scrollListener() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    const delta = 200.0;
    if (maxScroll - currentScroll <= delta) {
      _filteredSearchBloc.add(FilteredResultsOnReachBottomEvent());
    }
  }
}
