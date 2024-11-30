import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(createToJson: false)
final class Product {
  Product(this.id, this.pictureName, this.name, this.price);

  @JsonKey(name: "_id")
  final String id;
  final String pictureName;
  final String name;
  final int price;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
