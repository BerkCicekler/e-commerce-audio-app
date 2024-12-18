part of '../search_page.dart';

final class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        _SearchPageLocalization.appBarTitle,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      actions: [
        const BasketIconButton(),
        SizedBox(width: AppPaddingConstants.pageConst.right),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
