part of '../filter_bottom_sheet.dart';

final class _PriceRange extends StatelessWidget {
  const _PriceRange();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<_FilterBottomSheetViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BodyTextHead(_FilterBottomSheetLocalization.priceRange),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: AppTextField(
                controller: vm.minPriceController,
                hintText: _FilterBottomSheetLocalization.minPrice,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: AppTextField(
                controller: vm.maxPriceController,
                hintText: _FilterBottomSheetLocalization.maxPrice,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
