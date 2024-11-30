import 'package:ecommerceaudio/product/models/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_response_model.g.dart';

@JsonSerializable(createToJson: false)
final class CategoriesResponseModel {
  CategoriesResponseModel(this.categories);

  final List<Category> categories;

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseModelFromJson(json);
}
