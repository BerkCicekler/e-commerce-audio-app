part of '../home_page.dart';

final class _TextField extends StatelessWidget {
  const _TextField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddingConstants.pageConst.copyWith(top: 0),
      child: AppTextField(
        controller: TextEditingController(),
        hintText: 'Search headphone',
        svgIconPath: SvgConstants.search,
      ),
    );
  }
}
