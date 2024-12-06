part of '../filtered_results_page.dart';

final class _Titles extends StatelessWidget {
  const _Titles();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FilteredSearchBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _FilteredResultsLocalization.searching,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Text(
          bloc.searchText,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
