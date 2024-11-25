part of '../auth_page.dart';

final class _TopTexts extends StatelessWidget {
  const _TopTexts();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _AuthPageLocalizations.topHeader,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 55,
          ),
        ),
        Text(
          _AuthPageLocalizations.topText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
