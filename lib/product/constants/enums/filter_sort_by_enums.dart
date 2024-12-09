import 'package:json_annotation/json_annotation.dart';

enum FilterSortByEnums {
  @JsonValue('popularity')
  popularity('Popularity'),
  @JsonValue('newest')
  newest('Newest'),
  @JsonValue('oldest')
  oldest('Oldest'),
  @JsonValue('desc')
  ascending('High Price'),
  @JsonValue('asc')
  descending('Low Price'),
  @JsonValue('review')
  review('Review');

  final String text;
  const FilterSortByEnums(this.text);
}
