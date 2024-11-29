part of '../home_page.dart';

final class _WelcomeText extends StatelessWidget {
  const _WelcomeText();

  @override
  Widget build(BuildContext context) {
    final userName =
        context.read<AuthManagerBloc>().state as AuthManagerSuccessState;
    return Padding(
      padding: AppPaddingConstants.pageConst.copyWith(bottom: 0, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi, ${userName.user.name}',
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
          const Text(
            'What are you looking for today?',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              wordSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
