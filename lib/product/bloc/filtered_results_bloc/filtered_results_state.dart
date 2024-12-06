import 'package:ecommerceaudio/product/models/product.dart';
import 'package:ecommerceaudio/product/models/request_models/filter_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filtered_results_state.freezed.dart';

@freezed
class FilteredResultsState with _$FilteredSearchState {
  const factory FilteredResultsState({
    required List<Product> products,
    required FilteredResultsStatus status,
    required FilterRequestModel filterModel,
  }) = _FilteredSearchState;
}

enum FilteredResultsStatus {
  initial,
  loading,
  success,
  error,
  full;
}
