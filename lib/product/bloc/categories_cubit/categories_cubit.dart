import 'package:ecommerceaudio/product/models/category.dart';
import 'package:ecommerceaudio/product/services/categories_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

/// This is a cubit model for fetching the all category types from
/// the api
final class CategoriesCubit extends Cubit<List<Category>> {
  CategoriesCubit({required this.categoriesService}) : super([]);

  final CategoriesService categoriesService;

  Future<void> fetchCategories() async {
    try {
      final response = await categoriesService.getCategories();
      emit(response.categories);
    } catch (e) {
      Logger().e(e);
    }
  }
}
