import 'package:json_annotation/json_annotation.dart';

part 'basket_update_model.g.dart';

@JsonSerializable(createFactory: false)
final class BasketUpdateModel {
  BasketUpdateModel(this.basketId, this.count);

  final String basketId;
  final int count;

  Map<String, dynamic> toJson() => _$BasketUpdateModelToJson(this);
}
