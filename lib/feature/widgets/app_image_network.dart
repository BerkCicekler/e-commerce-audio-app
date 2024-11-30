import 'package:ecommerceaudio/product/constants/api_constants.dart';
import 'package:ecommerceaudio/product/constants/enums/end_point_enums.dart';
import 'package:flutter/widgets.dart';

final class AppImageWidget extends Image {
  AppImageWidget.network({
    required String imageName,
    super.fit,
  }) : super.network(
          ApiConstants.url + EndPointEnums.images.value + imageName,
        );
}
