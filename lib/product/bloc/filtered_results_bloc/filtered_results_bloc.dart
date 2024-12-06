import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:ecommerceaudio/product/bloc/filtered_results_bloc/filtered_results_state.dart';
import 'package:ecommerceaudio/product/models/request_models/filter_request_model.dart';
import 'package:ecommerceaudio/product/models/request_models/search_request_query_model.dart';
import 'package:ecommerceaudio/product/services/search_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

part 'filtered_results_event.dart';

/// This is a bloc for actually searching
/// it will fetch the products as the user's [searchText]
final class FilteredSearchBloc
    extends Bloc<FilteredResultsEvent, FilteredResultsState> {
  FilteredSearchBloc({required this.searchService, required this.searchText})
      : super(
          FilteredResultsState(
            products: [],
            status: FilteredResultsStatus.initial,
            filterModel: FilterRequestModel.defaultFilter(),
          ),
        ) {
    on<FilteredResultsOnReachBottomEvent>(
      _onReachBottomEvent,
      transformer: droppable(),
    );
    on<FilteredResultsFilterChangeEvent>(_onFilterChange);
  }
  final SearchService searchService;
  final String searchText;

  Future<void> _onReachBottomEvent(
    FilteredResultsOnReachBottomEvent event,
    Emitter<FilteredResultsState> emit,
  ) async {
    if (state.status == FilteredResultsStatus.full ||
        state.status == FilteredResultsStatus.error) {
      return;
    }
    emit(state.copyWith(status: FilteredResultsStatus.loading));
    try {
      final response = await searchService.SearchProducts(
        state.filterModel,
        SearchRequestQueryModel(searchText, state.products.length),
      );
      if (response.products.isEmpty) {
        emit(state.copyWith(status: FilteredResultsStatus.full));
        return;
      }
      emit(
        state.copyWith(
          products: state.products + response.products,
          status: FilteredResultsStatus.success,
        ),
      );
    } catch (e) {
      Logger().e(e);
      emit(state.copyWith(status: FilteredResultsStatus.error));
    }
  }

  void _onFilterChange(
    FilteredResultsFilterChangeEvent event,
    Emitter<FilteredResultsState> emit,
  ) {
    emit(
      FilteredResultsState(
        products: [],
        status: FilteredResultsStatus.initial,
        filterModel: event.filterRequestModel,
      ),
    );
  }
}
