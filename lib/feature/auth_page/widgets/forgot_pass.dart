part of '../auth_page.dart';

final class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword();

  @override
  Widget build(BuildContext context) {
    return Text(
      _AuthPageLocalizations.forgotPassword,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
