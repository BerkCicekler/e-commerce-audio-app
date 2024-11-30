import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(createToJson: false)
final class Category {
  Category({required this.id, required this.name});

  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'value')
  final String name;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
