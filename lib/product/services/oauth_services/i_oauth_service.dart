import 'package:ecommerceaudio/product/models/request_models/oauth_request_model.dart';

/// This class is being inherited on every oauth class we used in app
abstract class IOAuthSignInService {
  IOAuthSignInService({required this.svgLogoPath});

  /// this function has to be return a all the required data
  /// to making a oauth signIn api call to backend
  ///
  Future<OAuthRequestModel?> oAuthSignIn();
  final String svgLogoPath;
}
