part of '../search_page.dart';

final class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'Search',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      actions: [
        BasketIconButton(),
        SizedBox(width: AppPaddingConstants.pageConst.right)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
