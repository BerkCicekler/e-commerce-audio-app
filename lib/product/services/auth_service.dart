import 'package:ecommerceaudio/product/constants/enums/api_request_methods_enum.dart';
import 'package:ecommerceaudio/product/constants/enums/end_point_enums.dart';
import 'package:ecommerceaudio/product/models/base_response_model.dart';
import 'package:ecommerceaudio/product/models/request_models/login_request_model.dart';
import 'package:ecommerceaudio/product/models/request_models/oauth_request_model.dart';
import 'package:ecommerceaudio/product/models/request_models/register_request_model.dart';
import 'package:ecommerceaudio/product/services/network_service.dart';

class AuthService {
  Future<BaseResponse> login(LoginRequestModel loginRequestModel) async {
    return NetworkService.instance.baseRequest(
      EndPointEnums.authLogin,
      ApiRequestMethodsEnum.POST,
      loginRequestModel.toJson(),
    );
  }

  Future<BaseResponse> oAuthLogin(OAuthRequestModel oAuthRequestModel) async {
    return NetworkService.instance.baseRequest(
      EndPointEnums.authOauth,
      ApiRequestMethodsEnum.POST,
      oAuthRequestModel.toJson(),
    );
  }

  Future<BaseResponse> register(
    RegisterRequestModel registerRequestModel,
  ) async {
    return NetworkService.instance.baseRequest(
      EndPointEnums.authRegister,
      ApiRequestMethodsEnum.POST,
      registerRequestModel.toJson(),
    );
  }
}
