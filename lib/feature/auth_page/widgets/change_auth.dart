part of '../auth_page.dart';

final class _ChangeAuth extends StatelessWidget {
  const _ChangeAuth({
    required this.isSignInPage,
    required this.toggleSignInPage,
  });

  final bool isSignInPage;
  final void Function() toggleSignInPage;

  @override
  Widget build(BuildContext context) {
    const defaultStyle = TextStyle(
      color: Colors.white,
      fontFamily: FontConstants.DmSans,
    );
    const linkStyle = TextStyle(
      color: AppColorConstants.primaryColor,
      fontFamily: FontConstants.DmSans,
      fontWeight: FontWeight.w500,
    );
    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(
            text:
                '${isSignInPage ? _AuthPageLocalizations.noAccount1 : _AuthPageLocalizations.haveAccount1} ',
          ),
          TextSpan(
            text: isSignInPage
                ? _AuthPageLocalizations.noAccount2
                : _AuthPageLocalizations.haveAccount2,
            style: linkStyle,
            recognizer: TapGestureRecognizer()..onTap = toggleSignInPage,
          ),
        ],
      ),
    );
  }
}
