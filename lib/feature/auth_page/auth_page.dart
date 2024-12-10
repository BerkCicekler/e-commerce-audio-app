import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerceaudio/feature/widgets/form_inputs/text_form_field.dart';
import 'package:ecommerceaudio/product/bloc/auth_manager_bloc/auth_manager_bloc.dart';
import 'package:ecommerceaudio/product/cache/refresh_token_cache.dart';
import 'package:ecommerceaudio/product/constants/app_color_constants.dart';
import 'package:ecommerceaudio/product/constants/app_image_constants.dart';
import 'package:ecommerceaudio/product/constants/app_padding_constants.dart';
import 'package:ecommerceaudio/product/constants/font_constants.dart';
import 'package:ecommerceaudio/product/constants/radius_constants.dart';
import 'package:ecommerceaudio/product/constants/regexp_constants.dart';
import 'package:ecommerceaudio/product/constants/svg_constants.dart';
import 'package:ecommerceaudio/product/init/language/locale_keys.g.dart';
import 'package:ecommerceaudio/product/navigation/app_router.dart';
import 'package:ecommerceaudio/product/services/network_service.dart';
import 'package:ecommerceaudio/product/services/oauth_services/apple_oauth.dart';
import 'package:ecommerceaudio/product/services/oauth_services/facebook_oauth.dart';
import 'package:ecommerceaudio/product/services/oauth_services/google_oauth.dart';
import 'package:ecommerceaudio/product/services/oauth_services/i_oauth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'auth_mixin.dart';
part 'auth_page_localization.dart';
part 'widgets/change_auth.dart';
part 'widgets/forgot_pass.dart';
part 'widgets/form_field.dart';
part 'widgets/oauths.dart';
part 'widgets/top_texts.dart';

@RoutePage()
final class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with _AuthPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthManagerBloc, AuthManagerState>(
      listener: (_, s) => _onAuthManagerBlocChange(s),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _BackgroundImage(
          child: Padding(
            padding: AppPaddingConstants.pageConst,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  const _TopTexts(),
                  const SizedBox(height: 60),
                  _FormField(
                    authPageVariables: _authPageVariables,
                  ),
                  const SizedBox(height: 30),
                  _isSignInPage
                      ? const _OAuthHolder()
                      : const SizedBox.shrink(),
                  const SizedBox(height: 20),
                  _ChangeAuth(
                    isSignInPage: _isSignInPage,
                    toggleSignInPage: _toggleAuthState,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImageConstants.authBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
