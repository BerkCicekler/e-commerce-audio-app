import 'package:ecommerceaudio/product/models/basket_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basket_fetch_response_model.g.dart';

@JsonSerializable(createToJson: false)
final class BasketFetchResponseModel {
  BasketFetchResponseModel(this.basket);

  final List<BasketItem> basket;

  factory BasketFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BasketFetchResponseModelFromJson(json);
}
