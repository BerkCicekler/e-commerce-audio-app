import 'package:json_annotation/json_annotation.dart';

part 'basket_id_response_model.g.dart';

@JsonSerializable(createToJson: false)
final class BasketIdResponseModel {
  BasketIdResponseModel(this.id);

  final String id;

  factory BasketIdResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BasketIdResponseModelFromJson(json);
}
