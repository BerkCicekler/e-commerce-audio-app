enum FilterSortByEnums {
  popularity('Popularity'),
  newest('Newest'),
  oldest('Oldest'),
  ascending('High Price'),
  descending('Low Price'),
  review('Review');

  final String text;
  const FilterSortByEnums(this.text);
}
