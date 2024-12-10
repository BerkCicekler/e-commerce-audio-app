part of 'auth_page.dart';

mixin _AuthPageMixin on State<AuthPage> {
  @override
  void initState() {
    super.initState();
    _formState = GlobalKey<FormState>();
    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _authPageVariables = _AuthPageVariables(
      formState: _formState,
      userNameController: _userNameController,
      emailController: _emailController,
      passwordController: _passwordController,
      isSignInPage: _isSignInPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  late final GlobalKey<FormState> _formState;
  late final TextEditingController _userNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late _AuthPageVariables _authPageVariables;

  /// This variable is for detecting
  /// if the user seeing the sign in page or
  /// sign up page
  var _isSignInPage = true;

  /// toggle [_isSignInPage]
  void _toggleAuthState() {
    setState(() {
      _isSignInPage = !_isSignInPage;
      _authPageVariables = _AuthPageVariables(
        formState: _formState,
        userNameController: _userNameController,
        emailController: _emailController,
        passwordController: _passwordController,
        isSignInPage: _isSignInPage,
      );
    });
  }

  Future<void> _onAuthManagerBlocChange(AuthManagerState state) async {
    switch (state.runtimeType) {
      case AuthManagerErrorState:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text((state as AuthManagerErrorState).error),
          ),
        );
      case AuthManagerSuccessState:
        // the authPage is defined keepHistory=false
        // in AppRouter so we are just pushing out home page
        final successState = state as AuthManagerSuccessState;

        NetworkService.instance.setAccessToken(successState.token);
        RefreshTokenCache.instance.updateRefreshToken(state.refreshToken);

        context.router.push(const HomeRoute());

      default:
    }
  }
}

final class _AuthPageVariables {
  _AuthPageVariables({
    required this.formState,
    required this.userNameController,
    required this.emailController,
    required this.passwordController,
    required this.isSignInPage,
  });

  final GlobalKey<FormState> formState;
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isSignInPage;
}
