import 'package:ecommerceaudio/product/constants/enums/filter_sort_by_enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter_request_model.g.dart';

@JsonSerializable(createFactory: false)
final class FilterRequestModel {
  FilterRequestModel(this.category, this.sortBy, this.minPrice, this.maxPrice);

  final String category;
  final FilterSortByEnums sortBy;
  final int minPrice;
  final int maxPrice;

  Map<String, dynamic> toJson() => _$FilterRequestModelToJson(this);
}
