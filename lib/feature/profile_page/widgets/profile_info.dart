part of '../profile_page.dart';

final class _ProfileInfoHolder extends StatelessWidget {
  const _ProfileInfoHolder();

  @override
  Widget build(BuildContext context) {
    final user =
        (context.read<AuthManagerBloc>().state as AuthManagerSuccessState).user;
    return Padding(
      padding: AppPaddingConstants.pageConst,
      child: Row(
        children: [
          const CircleProfilePicture(35),
          const SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                user.email,
                style: const TextStyle(
                  color: AppColorConstants.greyDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
