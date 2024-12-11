part of '../home_page.dart';

final class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddingConstants.pageConst.copyWith(top: 0, bottom: 0),
      child: AppBar(
        leadingWidth: 30,
        centerTitle: true,
        leading: SvgPicture.asset(
          SvgConstants.menu,
          width: 20,
          fit: BoxFit.scaleDown,
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              SvgConstants.appLogo,
              width: 25,
            ),
            const SizedBox(width: 5),
            Text(
              'Audio',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              context.router.push(const ProfileRoute());
            },
            child: const CircleProfilePicture(17),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
