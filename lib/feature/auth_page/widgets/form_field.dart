part of '../auth_page.dart';

final class _FormField extends StatelessWidget {
  const _FormField({
    required this.authPageVariables,
  });

  final _AuthPageVariables authPageVariables;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: authPageVariables.formState,
      child: Column(
        children: [
          if (!authPageVariables.isSignInPage)
            _UserNameTextField(authPageVariables: authPageVariables)
          else
            const SizedBox.shrink(),
          const SizedBox(
            height: 20,
          ),
          _EmailTextField(authPageVariables: authPageVariables),
          const SizedBox(
            height: 20,
          ),
          _PasswordTextField(authPageVariables: authPageVariables),
          const SizedBox(height: 20),
          const _ForgotPassword(),
          const SizedBox(height: 30),
          _SignInAndSignUpElevatedButton(
            authPageVariables: authPageVariables,
          ),
        ],
      ),
    );
  }
}

final class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    required this.authPageVariables,
  });

  final _AuthPageVariables authPageVariables;

  @override
  Widget build(BuildContext context) {
    return FormTextField(
      svgIconPath: SvgConstants.lock,
      controller: authPageVariables.passwordController,
      hintText: _AuthPageLocalizations.password,
    );
  }
}

final class _EmailTextField extends StatelessWidget {
  const _EmailTextField({
    required this.authPageVariables,
  });

  final _AuthPageVariables authPageVariables;

  @override
  Widget build(BuildContext context) {
    return FormTextField(
      svgIconPath: SvgConstants.mail,
      controller: authPageVariables.emailController,
      hintText: _AuthPageLocalizations.email,
      validator: (value) {
        if (!RegExpConstants.email.hasMatch(value ?? '')) {
          return "Email isn't right";
        }
        return null;
      },
    );
  }
}

final class _UserNameTextField extends StatelessWidget {
  const _UserNameTextField({
    required this.authPageVariables,
  });

  final _AuthPageVariables authPageVariables;

  @override
  Widget build(BuildContext context) {
    return FormTextField(
      svgIconPath: SvgConstants.profile,
      controller: authPageVariables.userNameController,
      hintText: _AuthPageLocalizations.userName,
      validator: (value) {
        if (value == null || value.length < 5) {
          return 'User name have to be longer';
        }
        return null;
      },
    );
  }
}

final class _SignInAndSignUpElevatedButton extends StatelessWidget {
  const _SignInAndSignUpElevatedButton({
    required this.authPageVariables,
  });

  final _AuthPageVariables authPageVariables;

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthManagerBloc>();
    return BlocBuilder<AuthManagerBloc, AuthManagerState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: state is AuthManagerLoadingState
              ? null
              : () {
                  final isValid =
                      authPageVariables.formState.currentState?.validate();
                  if (isValid == null || isValid == false) {
                    return;
                  }
                  authBloc.add(
                    AuthPageOnButtonClickEvent(
                      authPageVariables.userNameController.text,
                      authPageVariables.emailController.text,
                      authPageVariables.passwordController.text,
                      authPageVariables.isSignInPage,
                    ),
                  );
                },
          child: state is AuthManagerLoadingState
              ? const CircularProgressIndicator.adaptive()
              : Text(
                  authPageVariables.isSignInPage
                      ? _AuthPageLocalizations.signIn
                      : _AuthPageLocalizations.signUp,
                ),
        );
      },
    );
  }
}
