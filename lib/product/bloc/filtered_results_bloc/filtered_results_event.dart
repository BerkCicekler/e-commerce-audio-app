part of 'filtered_results_bloc.dart';

sealed class FilteredResultsEvent {}

final class FilteredResultsOnReachBottomEvent extends FilteredResultsEvent {}

final class FilteredResultsFilterChangeEvent extends FilteredResultsEvent {
  FilteredResultsFilterChangeEvent(this.filterRequestModel);

  final FilterRequestModel filterRequestModel;
}
