part of 'filter_bottom_sheet.dart';

final class _FilterBottomSheetViewModel extends ChangeNotifier {
  late final TextEditingController minPriceController;
  late final TextEditingController maxPriceController;

  late FilterSortByEnums sortByEnum;

  late FilterRequestModel newFilterModel;

  _FilterBottomSheetViewModel(FilterRequestModel filterModel) {
    newFilterModel = filterModel;
    sortByEnum = filterModel.sortBy;
    minPriceController = TextEditingController();
    maxPriceController = TextEditingController();
    if (filterModel.minPrice != 0) {
      minPriceController.text = filterModel.minPrice.toString();
    }
    if (filterModel.maxPrice != 0) {
      maxPriceController.text = filterModel.maxPrice.toString();
    }
  }

  void sortByChange(FilterSortByEnums val) {
    sortByEnum = val;
    notifyListeners();
  }

  void onCompleteButton(BuildContext context) {
    Navigator.of(context).pop(
      FilterRequestModel(
        '',
        sortByEnum,
        int.tryParse(minPriceController.text) ?? 0,
        int.tryParse(maxPriceController.text) ?? 0,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    maxPriceController.dispose();
    minPriceController.dispose();
  }
}
