part of '../search_page.dart';

final class _HistoryHolder extends StatelessWidget {
  const _HistoryHolder();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest search',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 15),
          _HistoriesStream(),
        ],
      ),
    );
  }
}

final class _HistoriesStream extends StatelessWidget {
  const _HistoriesStream();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: SearchHistoryCache.instance.listenCollectionStream(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (_, i) {
              final datas = snapshot.data!.reversed.toList();
              return _History(datas[i]);
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}

final class _History extends StatelessWidget {
  const _History(this.model);

  final SearchHistory model;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<_SearchViewModel>(context);
    return InkWell(
      onTap: () => vm.onSearchHistoryTap(model),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            SvgPicture.asset(
              SvgConstants.clock,
              width: 22,
            ),
            const SizedBox(width: 10),
            Text(
              model.searchText!,
              style: const TextStyle(fontSize: 17),
            ),
            const Spacer(),
            InkWell(
              customBorder: const CircleBorder(),
              onTap: () => vm.onSearchRemove(model),
              child: SvgPicture.asset(
                SvgConstants.xIcon,
                width: 25,
                fit: BoxFit.fill,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
