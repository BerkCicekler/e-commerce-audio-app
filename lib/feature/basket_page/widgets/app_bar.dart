part of '../basket_page.dart';

final class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BasketBloc>();
    return AppBar(
      centerTitle: true,
      title: Text(
        _BasketPageLocalization.appBarTitle,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      actions: [
        InkWell(
          onTap: () {
            bloc.add(BasketClearAllEvent());
          },
          child: SvgPicture.asset(
            SvgConstants.trash,
            width: 28,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
