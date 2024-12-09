import 'package:ecommerceaudio/product/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basket_item.g.dart';

@JsonSerializable(createToJson: false)
final class BasketItem extends Equatable {
  BasketItem(this.id, this.product, this.count);

  final String id;
  final Product product;
  final int count;

  factory BasketItem.fromJson(Map<String, dynamic> json) =>
      _$BasketItemFromJson(json);

  @override
  List<Object?> get props => [id, count];
}
