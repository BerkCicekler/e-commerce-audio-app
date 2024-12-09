import 'package:json_annotation/json_annotation.dart';

part 'basket_add_model.g.dart';

@JsonSerializable(createFactory: false)
final class BasketAddModel {
  BasketAddModel(this.id);

  final String id;

  Map<String, dynamic> toJson() => _$BasketAddModelToJson(this);
}
