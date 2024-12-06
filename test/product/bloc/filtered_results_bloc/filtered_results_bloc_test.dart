import 'package:bloc_test/bloc_test.dart';
import 'package:ecommerceaudio/product/bloc/filtered_results_bloc/filtered_results_bloc.dart';
import 'package:ecommerceaudio/product/bloc/filtered_results_bloc/filtered_results_state.dart';
import 'package:ecommerceaudio/product/constants/enums/filter_sort_by_enums.dart';
import 'package:ecommerceaudio/product/models/product.dart';
import 'package:ecommerceaudio/product/models/request_models/filter_request_model.dart';
import 'package:ecommerceaudio/product/models/request_models/search_request_query_model.dart';
import 'package:ecommerceaudio/product/models/response_models/product_response_model.dart';
import 'package:ecommerceaudio/product/services/search_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class MockSearchService extends Mock implements SearchService {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      FilterRequestModel('', FilterSortByEnums.newest, 0, 0),
    );
    registerFallbackValue(SearchRequestQueryModel('', 0));
  });

  late MockSearchService mockFreshService;

  setUp(() {
    mockFreshService = MockSearchService();
  });

  group('Filtered Search Bloc ', () {
    final mockSearchService = MockSearchService();
    final dummyProductResponse = ProductResponseModel([Product('', '', '', 0)]);
    final dummyEmptyProductResponse = ProductResponseModel([]);

    blocTest<FilteredSearchBloc, FilteredResultsState>(
      'Initial values are correct',
      build: () =>
          FilteredSearchBloc(searchService: mockSearchService, searchText: ''),
      verify: (bloc) => expect(
        bloc.state,
        FilteredResultsState(
          products: [],
          status: FilteredResultsStatus.initial,
          filterModel: FilterRequestModel.defaultFilter(),
        ),
      ),
    );

    blocTest<FilteredSearchBloc, FilteredResultsState>(
      'Filter Change event changes filter',
      build: () =>
          FilteredSearchBloc(searchService: mockSearchService, searchText: ''),
      act: (bloc) => bloc.add(
        FilteredResultsFilterChangeEvent(
          FilterRequestModel('1', FilterSortByEnums.newest, 1, 2),
        ),
      ),
      verify: (bloc) => expect(
        bloc.state.filterModel,
        FilterRequestModel('1', FilterSortByEnums.newest, 1, 2),
      ),
    );

    blocTest<FilteredSearchBloc, FilteredResultsState>(
      'On Fetch values loading state then success and product set',
      build: () =>
          FilteredSearchBloc(searchService: mockSearchService, searchText: ''),
      act: (bloc) => bloc.add(FilteredResultsOnReachBottomEvent()),
      setUp: () {
        when(
          () => mockSearchService.SearchProducts(any(), any()),
        ).thenAnswer((_) async => dummyProductResponse);
      },
      expect: () => [
        FilteredResultsState(
          products: [],
          status: FilteredResultsStatus.loading,
          filterModel: FilterRequestModel.defaultFilter(),
        ),
        FilteredResultsState(
          products: dummyProductResponse.products,
          status: FilteredResultsStatus.success,
          filterModel: FilterRequestModel.defaultFilter(),
        ),
      ],
    );

    blocTest<FilteredSearchBloc, FilteredResultsState>(
      'On Fetch empty state.status is full',
      build: () =>
          FilteredSearchBloc(searchService: mockSearchService, searchText: ''),
      act: (bloc) => bloc.add(FilteredResultsOnReachBottomEvent()),
      setUp: () {
        when(
          () => mockSearchService.SearchProducts(any(), any()),
        ).thenAnswer((_) async => dummyEmptyProductResponse);
      },
      verify: (bloc) {
        expect(bloc.state.status, FilteredResultsStatus.full);
      },
    );

    blocTest<FilteredSearchBloc, FilteredResultsState>(
      'On Fetch error status is error',
      build: () =>
          FilteredSearchBloc(searchService: mockSearchService, searchText: ''),
      act: (bloc) => bloc.add(FilteredResultsOnReachBottomEvent()),
      setUp: () {
        when(
          () => mockSearchService.SearchProducts(any(), any()),
        ).thenThrow(Exception('dummy'));
      },
      verify: (bloc) {
        expect(bloc.state.status, FilteredResultsStatus.error);
      },
    );

    blocTest<FilteredSearchBloc, FilteredResultsState>(
      'search service doesnt being called if the status is full',
      build: () => FilteredSearchBloc(
        searchService: mockFreshService,
        searchText: '',
      ),
      act: (bloc) => bloc
        ..add(FilteredResultsOnReachBottomEvent())
        ..add(FilteredResultsOnReachBottomEvent()),
      setUp: () {
        when(
          () => mockFreshService.SearchProducts(any(), any()),
        ).thenAnswer((_) async => dummyEmptyProductResponse);
      },
      verify: (bloc) {
        verify(() => mockFreshService.SearchProducts(any(), any())).called(1);
      },
    );

    blocTest<FilteredSearchBloc, FilteredResultsState>(
      'search service doesnt being called if the status is error',
      build: () =>
          FilteredSearchBloc(searchService: mockFreshService, searchText: ''),
      act: (bloc) => bloc
        ..add(FilteredResultsOnReachBottomEvent())
        ..add(FilteredResultsOnReachBottomEvent()),
      setUp: () {
        when(
          () => mockFreshService.SearchProducts(any(), any()),
        ).thenThrow(Exception('dummy'));
      },
      verify: (bloc) {
        verify(() => mockFreshService.SearchProducts(any(), any())).called(1);
      },
    );

    blocTest<FilteredSearchBloc, FilteredResultsState>(
      'successfully fetch product   ',
      build: () =>
          FilteredSearchBloc(searchService: mockSearchService, searchText: ''),
      act: (bloc) => bloc.add(FilteredResultsOnReachBottomEvent()),
      setUp: () {
        when(
          () => mockSearchService.SearchProducts(any(), any()),
        ).thenAnswer((_) async => dummyProductResponse);
      },
      verify: (bloc) {
        expect(bloc.state.products, dummyProductResponse.products);
        expect(bloc.state.status, FilteredResultsStatus.success);
      },
    );
  });
}
