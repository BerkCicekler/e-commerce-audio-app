import 'package:dio/dio.dart';
import 'package:ecommerceaudio/feature/widgets/app_snack_bar_util.dart';
import 'package:ecommerceaudio/product/constants/enums/snack_bar_status_enum.dart';

/// This is a special interceptor for when the API
/// returns an "error" in a failed request. it displays
/// a snack bar to inform the user
final class ErrorSnackBarInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.data is Map<String, dynamic> &&
        (err.response?.data as Map<String, dynamic>)['error'] != null) {
      final errorString =
          (err.response!.data as Map<String, dynamic>)['error']! as String;
      handler.reject(
        err.copyWith(
          error: errorString,
        ),
      );
      AppSnackBarUtil.showSnackBar(errorString, SnackBarStatusEnum.error);
    }

    handler.next(err);
  }
}
