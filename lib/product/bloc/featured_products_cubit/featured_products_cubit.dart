import 'package:ecommerceaudio/product/constants/enums/filter_sort_by_enums.dart';
import 'package:ecommerceaudio/product/models/product.dart';
import 'package:ecommerceaudio/product/models/request_models/filter_request_model.dart';
import 'package:ecommerceaudio/product/models/request_models/search_request_query_model.dart';
import 'package:ecommerceaudio/product/services/search_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

/// This is a cubit generated for HomePage screen to fetch featured
/// products
final class FeaturedProductsCubit extends Cubit<FeaturedProductsCubitState> {
  FeaturedProductsCubit({required this.searchService})
      : super(
          FeaturedProductsCubitState(
            [],
            FeaturedProductsStatus.init,
          ),
        );

  final SearchService searchService;

  Future<void> fetchFeaturedProducts(String categoryId) async {
    emit(FeaturedProductsCubitState([], FeaturedProductsStatus.loading));
    try {
      final filter = FilterRequestModel(
        categoryId,
        FilterSortByEnums.popularity,
        0,
        0,
      );

      final response = await searchService.SearchProducts(
        filter,
        SearchRequestQueryModel('', 0),
      );
      emit(
        FeaturedProductsCubitState(
          response.products,
          FeaturedProductsStatus.success,
        ),
      );
    } catch (e) {
      emit(FeaturedProductsCubitState([], FeaturedProductsStatus.error));
      Logger().e(e);
    }
  }
}

enum FeaturedProductsStatus {
  init,
  loading,
  success,
  error;
}

final class FeaturedProductsCubitState extends Equatable {
  FeaturedProductsCubitState(this.products, this.status);

  final List<Product> products;
  final FeaturedProductsStatus status;

  @override
  List<Object?> get props => [products, status];
}
