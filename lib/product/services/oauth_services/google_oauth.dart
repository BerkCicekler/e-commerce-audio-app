import 'package:ecommerceaudio/product/constants/svg_constants.dart';
import 'package:ecommerceaudio/product/models/request_models/oauth_request_model.dart';
import 'package:ecommerceaudio/product/services/oauth_services/i_oauth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

final class OAuthGoogleSignInService extends IOAuthSignInService {
  OAuthGoogleSignInService() : super(svgLogoPath: SvgConstants.oauth_google);

  @override
  Future<OAuthRequestModel?> oAuthSignIn() async {
    final google = GoogleSignIn(
      scopes: <String>[
        'email',
        'https://www.googleapis.com/auth/userinfo.profile',
      ],
      serverClientId:
          '644964721466-66dvkufk8uqep4l7qlepman679lbj9d7.apps.googleusercontent.com',
    );

    await google.disconnect();
    await google.signOut();
    final account = await google.signIn();

    if (account == null) {
      throw Exception('Google Account not exist');
    }

    final auth = await account.authentication;
    print(auth.idToken);
    print(account.displayName);

    if (auth.idToken == null || auth.idToken!.isEmpty) {
      throw Exception('Google Id Token not exist');
    }

    final oAuthRequestModel = OAuthRequestModel(
      auth.idToken!,
      account.displayName ?? 'User',
      account.email,
    );
    return oAuthRequestModel;
  }
}
