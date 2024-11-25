import 'package:dio/dio.dart';

/// [BaseResponse] is used in Network responses
final class BaseResponse {
  BaseResponse(this.statusCode, this.data);
  final int statusCode;
  final Map<String, dynamic> data;

  factory BaseResponse.fromResponse(
    Response<Map<String, dynamic>> response,
  ) {
    return BaseResponse(response.statusCode ?? 500, response.data ?? {});
  }

  /// This value will contain the reason of why the request failed
  /// if the [statusCode] between 200 and 299 [clientErrorMessage] will be null
  String? get clientErrorMessage {
    if (statusCode >= 400 && statusCode <= 500) {
      if (data['error'] == null) {
        return 'Unexpected error';
      }
      return data['error'] as String;
    }
    return null;
  }

  /// This variable will show us if the request is succeed
  /// and if the [statusCode] is 200 or 201 it will return true
  bool get isSucceed => statusCode == 200 || statusCode == 201;
}
