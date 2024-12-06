part of '../filter_bottom_sheet.dart';

final class _SortByHolder extends StatelessWidget {
  const _SortByHolder();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<_FilterBottomSheetViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BodyTextHead(_FilterBottomSheetLocalization.sortBy),
        Wrap(
          children: [
            for (final item in FilterSortByEnums.values) _SortByChip(item, vm),
          ],
        ),
      ],
    );
  }
}

final class _SortByChip extends StatelessWidget {
  const _SortByChip(this.enumVal, this.vmModel);

  final FilterSortByEnums enumVal;
  final _FilterBottomSheetViewModel vmModel;

  bool get _isSelected => vmModel.sortByEnum == enumVal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => vmModel.sortByChange(enumVal),
      child: Container(
        padding: const EdgeInsets.only(
          top: 11,
          bottom: 11,
          left: 12.5,
          right: 12.5,
        ),
        margin: const EdgeInsets.only(right: 15, top: 15),
        decoration: BoxDecoration(
          border: !_isSelected
              ? Border.all(
                  color: AppColorConstants.greyDark,
                )
              : null,
          borderRadius: RadiusConstants.smallBorderRadius,
          color: _isSelected ? theme.colorScheme.onPrimary : null,
        ),
        child: Text(
          enumVal.text,
          style: TextStyle(
            fontSize: 17,
            color: _isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
