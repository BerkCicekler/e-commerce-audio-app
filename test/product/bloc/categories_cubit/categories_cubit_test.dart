import 'package:bloc_test/bloc_test.dart';
import 'package:ecommerceaudio/product/bloc/categories_cubit/categories_cubit.dart';
import 'package:ecommerceaudio/product/models/category.dart';
import 'package:ecommerceaudio/product/models/response_models/categories_response_model.dart';
import 'package:ecommerceaudio/product/services/categories_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class MockCategoriesService extends Mock implements CategoriesService {}

void main() {
  group('Categories Cubit', () {
    final mockCategoriesService = MockCategoriesService();
    final dummyCategoryRes =
        CategoriesResponseModel([Category(id: '1', name: 'dummy')]);
    blocTest<CategoriesCubit, List<Category>>(
      'is Initial state correct',
      build: () {
        return CategoriesCubit(categoriesService: mockCategoriesService);
      },
      verify: (bloc) {
        expect(bloc.state, <Category>[]);
      },
    );

    blocTest<CategoriesCubit, List<Category>>(
      'On successfully response the state is correct',
      build: () {
        return CategoriesCubit(categoriesService: mockCategoriesService);
      },
      act: (bloc) => bloc.fetchCategories(),
      setUp: () {
        when(() => mockCategoriesService.getCategories())
            .thenAnswer((_) async => dummyCategoryRes);
      },
      verify: (bloc) {
        expect(bloc.state, dummyCategoryRes.categories);
      },
    );
  });
}
