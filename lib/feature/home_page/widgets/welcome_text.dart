part of '../home_page.dart';

final class _WelcomeText extends StatelessWidget {
  const _WelcomeText();

  @override
  Widget build(BuildContext context) {
    final authState =
        context.read<AuthManagerBloc>().state as AuthManagerSuccessState;
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: AppPaddingConstants.pageConst.copyWith(bottom: 0, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _HomePageLocalization.hi(authState.user.name),
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            Text(
              _HomePageLocalization.lookingFor,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                wordSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
