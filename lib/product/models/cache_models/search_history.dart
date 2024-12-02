import 'package:isar/isar.dart';

part 'search_history.g.dart';

@collection
class SearchHistory {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? searchText;
}
