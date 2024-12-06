part of '../filter_bottom_sheet.dart';

final class _Top extends StatelessWidget {
  const _Top({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _FilterBottomSheetLocalization.filter,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SvgPicture.asset(
            SvgConstants.xIcon,
            width: 25,
          ),
        ),
      ],
    );
  }
}
