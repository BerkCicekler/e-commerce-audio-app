part of '../home_page.dart';

final class _TextField extends StatelessWidget {
  const _TextField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddingConstants.pageConst.copyWith(top: 0),
      child: Focus(
        child: Hero(
          tag: 'searchTag',
          child: Material(
            child: AppTextField(
              readonly: true,
              onTap: () {
                context.router.push(const SearchRoute());
              },
              controller: TextEditingController(),
              hintText: _HomePageLocalization.textFieldHint,
              svgIconPath: SvgConstants.search,
            ),
          ),
        ),
      ),
    );
  }
}
