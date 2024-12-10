import 'package:ecommerceaudio/product/constants/enums/api_request_methods_enum.dart';
import 'package:ecommerceaudio/product/constants/enums/end_point_enums.dart';
import 'package:ecommerceaudio/product/models/request_models/login_request_model.dart';
import 'package:ecommerceaudio/product/models/request_models/oauth_request_model.dart';
import 'package:ecommerceaudio/product/models/request_models/register_request_model.dart';
import 'package:ecommerceaudio/product/models/response_models/sign_in_response_model.dart';
import 'package:ecommerceaudio/product/services/network_service.dart';

class AuthService {
  Future<SignInResponseModel> login(LoginRequestModel loginRequestModel) async {
    final response = await NetworkService.instance.baseRequest(
      EndPointEnums.authLogin,
      ApiRequestMethodsEnum.POST,
      loginRequestModel.toJson(),
    );
    return SignInResponseModel.fromJson(response.data);
  }

  Future<SignInResponseModel> oAuthLogin(
      OAuthRequestModel oAuthRequestModel) async {
    final response = await NetworkService.instance.baseRequest(
      EndPointEnums.authOauth,
      ApiRequestMethodsEnum.POST,
      oAuthRequestModel.toJson(),
    );
    return SignInResponseModel.fromJson(response.data);
  }

  Future<SignInResponseModel> register(
    RegisterRequestModel registerRequestModel,
  ) async {
    final response = await NetworkService.instance.baseRequest(
      EndPointEnums.authRegister,
      ApiRequestMethodsEnum.POST,
      registerRequestModel.toJson(),
    );
    return SignInResponseModel.fromJson(response.data);
  }

  Future<SignInResponseModel> refreshToken(String refreshToken) async {
    NetworkService.instance.setAccessToken(refreshToken);
    final response = await NetworkService.instance.baseRequest(
      EndPointEnums.refreshToken,
      ApiRequestMethodsEnum.POST,
      {},
    );
    return SignInResponseModel.fromJson(response.data);
  }
}
