part of '../product_page.dart';

final class _Tabbar extends StatefulWidget {
  const _Tabbar();

  @override
  State<_Tabbar> createState() => _TabbarState();
}

final class _TabbarState extends State<_Tabbar> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
          labelPadding: const EdgeInsets.only(right: 30),
          indicator: UnderlineTabIndicator(
            insets: const EdgeInsets.symmetric(horizontal: 22),
            borderSide: BorderSide(
              color: theme.colorScheme.onPrimary,
              width: 3,
            ),
          ),
          labelColor: Colors.black,
          dividerColor: Colors.transparent,
          indicatorColor: theme.colorScheme.onPrimary,
          labelStyle: const TextStyle(fontSize: 16),
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Features'),
            Tab(text: 'Specification'),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              _OverviewView(),
              Center(
                child: Text('dummy page'),
              ),
              Center(
                child: Text('dummy page'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
