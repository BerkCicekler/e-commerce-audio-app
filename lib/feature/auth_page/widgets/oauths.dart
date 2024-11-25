part of '../auth_page.dart';

final class _OAuthHolder extends StatelessWidget {
  const _OAuthHolder();

  @override
  Widget build(BuildContext context) {
    final oAuthService = <IOAuthSignInService>[
      OAuthGoogleSignInService(),
      OAuthFacebookSignInService(),
      OAuthAppleSignInService(),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          oAuthService.map((service) => _OAuthContainer(service)).toList(),
    );
  }
}

final class _OAuthContainer extends StatelessWidget {
  const _OAuthContainer(this.oAuthService);

  final IOAuthSignInService oAuthService;

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthManagerBloc>();
    return InkWell(
      onTap: () {
        authBloc.add(AuthPageOnOAuthSignInEvent(oAuthService));
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: RadiusConstants.formInputCircularRadius,
          color: Colors.white,
        ),
        child: SvgPicture.asset(
          oAuthService.svgLogoPath,
          width: 55,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
