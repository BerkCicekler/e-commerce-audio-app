part of '../filtered_results_page.dart';

final class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        const BasketIconButton(),
        SizedBox(
          width: AppPaddingConstants.pageConst.right,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
