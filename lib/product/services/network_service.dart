import 'package:dio/dio.dart';
import 'package:ecommerceaudio/product/constants/api_constants.dart';
import 'package:ecommerceaudio/product/constants/enums/api_request_methods_enum.dart';
import 'package:ecommerceaudio/product/constants/enums/end_point_enums.dart';
import 'package:ecommerceaudio/product/models/base_response_model.dart';
import 'package:ecommerceaudio/product/services/interceptors/snack_bar_interceptor.dart';

final class NetworkService {
  NetworkService._() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.url,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
      ),
    );
    _dio.interceptors.add(ErrorSnackBarInterceptor());
  }

  static late final Dio _dio;

  static final instance = NetworkService._();

  Future<BaseResponse> baseRequest(
    EndPointEnums endPoint,
    ApiRequestMethodsEnum method,
    Map<String, dynamic>? data, {
    Map<String, dynamic>? queryData,
  }) async {
    final response = await _dio.request<Map<String, dynamic>>(
      ApiConstants.url + endPoint.value,
      data: data,
      queryParameters: queryData,
      options: Options(
        method: method.value,
      ),
    );
    return BaseResponse.fromResponse(response);
  }

  // change the header's accessToken key
  void setAccessToken(String accessToken) {
    _dio.options.headers['Authorization'] = accessToken;
  }
}
