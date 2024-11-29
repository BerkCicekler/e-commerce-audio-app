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
        title: Text(
          'Audio',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: const [
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
                'https://img.freepik.com/premium-photo/graphic-designer-digital-avatar-generative-ai_934475-9292.jpg'),
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
