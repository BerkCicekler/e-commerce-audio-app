part of '../search_page.dart';

final class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    final searchVM = Provider.of<_SearchViewModel>(context);
    return Hero(
      tag: 'searchTag',
      child: Material(
        child: AppTextField(
          onSubmitted: searchVM.onSearchSubmit,
          autoFocus: true,
          controller: searchVM._searchController,
          hintText: 'Search headphone',
          svgIconPath: SvgConstants.search,
          textInputAction: TextInputAction.search,
        ),
      ),
    );
  }
}
