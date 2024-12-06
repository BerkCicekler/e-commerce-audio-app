part of '../filtered_results_page.dart';

final class _FiltersRow extends StatelessWidget {
  const _FiltersRow();

  @override
  Widget build(BuildContext context) {
    final filterSearchBloc = context.watch<FilteredSearchBloc>();
    return SizedBox(
      height: 50,
      child: ListView.builder(
        // value increased by 1 because
        // we are also adding a custom filter editor
        itemCount: FilterSortByEnums.values.length + 1,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _FilterChip(filterSearchBloc: filterSearchBloc);
          }
          final currentSortByVal = FilterSortByEnums.values[index - 1];
          return _SortByChip(
            onTap: () {
              filterSearchBloc
                ..add(
                  FilteredResultsFilterChangeEvent(
                    FilterRequestModel('', currentSortByVal, 0, 0),
                  ),
                )
                ..add(FilteredResultsOnReachBottomEvent());
            },
            // the idea of this part is
            // first we are controlling if the only filterModel's sortBy
            // has been set and if the sortBy value equals to our bloc's
            // filterModel's sortBy value we are marking chip as selected
            isSelected:
                filterSearchBloc.state.filterModel.sortBy == currentSortByVal &&
                    filterSearchBloc.state.filterModel.isOnlySortBySetted,
            text: currentSortByVal.text,
          );
        },
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.filterSearchBloc,
  });

  final FilteredSearchBloc filterSearchBloc;

  @override
  Widget build(BuildContext context) {
    return _SortByChip(
      onTap: () async {
        final model = await FilterBottomSheet.showModal(
            context, filterSearchBloc.state.filterModel);
        if (model != null) {
          filterSearchBloc
            ..add(FilteredResultsFilterChangeEvent(model))
            ..add(FilteredResultsOnReachBottomEvent());
        }
      },
      isSelected: !filterSearchBloc.state.filterModel.isOnlySortBySetted,
      text: 'Filter',
      icon: SvgPicture.asset(SvgConstants.filter),
    );
  }
}

final class _SortByChip extends StatelessWidget {
  const _SortByChip({
    required this.onTap,
    required this.isSelected,
    required this.text,
    this.icon,
  });

  final void Function() onTap;
  final bool isSelected;
  final String text;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    );
    return InkWell(
      borderRadius: RadiusConstants.smallBorderRadius,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          top: 11,
          bottom: 11,
          left: 15,
          right: 15,
        ),
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(
                  color: AppColorConstants.greyDark,
                )
              : null,
          borderRadius: RadiusConstants.smallBorderRadius,
        ),
        child: icon == null
            ? textWidget
            : Row(
                children: [
                  icon!,
                  const SizedBox(width: 8),
                  textWidget,
                ],
              ),
      ),
    );
  }
}
