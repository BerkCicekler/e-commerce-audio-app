import 'package:ecommerceaudio/product/constants/svg_constants.dart';
import 'package:ecommerceaudio/product/models/request_models/oauth_request_model.dart';
import 'package:ecommerceaudio/product/services/oauth_services/i_oauth_service.dart';

final class OAuthAppleSignInService extends IOAuthSignInService {
  OAuthAppleSignInService() : super(svgLogoPath: SvgConstants.oauth_apple);

  @override
  Future<OAuthRequestModel> oAuthSignIn() async {
    return OAuthRequestModel('', '', '');
  }
}
