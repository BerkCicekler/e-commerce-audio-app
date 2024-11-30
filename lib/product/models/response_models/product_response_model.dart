import 'package:ecommerceaudio/product/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_response_model.g.dart';

@JsonSerializable(createToJson: false)
final class ProductResponseModel {
  ProductResponseModel(this.products);

  final List<Product> products;

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);
}
