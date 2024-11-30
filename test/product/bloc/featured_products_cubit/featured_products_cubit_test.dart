import 'package:bloc_test/bloc_test.dart';
import 'package:ecommerceaudio/product/bloc/featured_products_cubit/featured_products_cubit.dart';
import 'package:ecommerceaudio/product/constants/enums/filter_sort_by_enums.dart';
import 'package:ecommerceaudio/product/models/product.dart';
import 'package:ecommerceaudio/product/models/request_models/filter_request_model.dart';
import 'package:ecommerceaudio/product/models/response_models/product_response_model.dart';
import 'package:ecommerceaudio/product/services/search_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class MockSearchService extends Mock implements SearchService {}

void main() {
  setUpAll(() {
    registerFallbackValue(
        FilterRequestModel('', '', 0, FilterSortByEnums.popularity, 0, 0));
  });

  group('Featured products bloc', () {
    final mockSearchService = MockSearchService();
    final dummyProductRes = ProductResponseModel([Product('', '', '', 0)]);

    blocTest<FeaturedProductsCubit, FeaturedProductsCubitState>(
      'is initial value correct',
      build: () => FeaturedProductsCubit(searchService: mockSearchService),
      verify: (bloc) {
        expect(
          bloc.state,
          FeaturedProductsCubitState(
            const <Product>[],
            FeaturedProductsStatus.init,
          ),
        );
      },
    );

    blocTest<FeaturedProductsCubit, FeaturedProductsCubitState>(
      'on fetchFeaturedProducts successfully, status is first loading then success with data',
      build: () => FeaturedProductsCubit(searchService: mockSearchService),
      setUp: () {
        when(() => mockSearchService.SearchProducts(any()))
            .thenAnswer((_) async => dummyProductRes);
      },
      act: (bloc) => bloc.fetchFeaturedProducts('1'),
      expect: () => [
        FeaturedProductsCubitState(const [], FeaturedProductsStatus.loading),
        FeaturedProductsCubitState(
          dummyProductRes.products,
          FeaturedProductsStatus.success,
        ),
      ],
    );

    blocTest<FeaturedProductsCubit, FeaturedProductsCubitState>(
      'on fetchFeaturedProducts error,',
      build: () => FeaturedProductsCubit(searchService: mockSearchService),
      setUp: () {
        when(() => mockSearchService.SearchProducts(any()))
            .thenThrow(Exception('dummy'));
      },
      act: (bloc) => bloc.fetchFeaturedProducts('1'),
      expect: () => [
        FeaturedProductsCubitState(const [], FeaturedProductsStatus.loading),
        FeaturedProductsCubitState(
          const <Product>[],
          FeaturedProductsStatus.error,
        ),
      ],
    );
  });
}
