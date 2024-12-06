import 'package:json_annotation/json_annotation.dart';

part 'search_request_query_model.g.dart';

@JsonSerializable(createFactory: false)
final class SearchRequestQueryModel {
  SearchRequestQueryModel(this.search, this.offset);

  final String search;
  final int offset;

  Map<String, dynamic> toJson() => _$SearchRequestQueryModelToJson(this);
}
