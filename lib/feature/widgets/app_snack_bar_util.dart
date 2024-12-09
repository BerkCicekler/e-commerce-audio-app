import 'package:ecommerceaudio/product/constants/app_color_constants.dart';
import 'package:ecommerceaudio/product/constants/enums/snack_bar_status_enum.dart';
import 'package:ecommerceaudio/product/constants/radius_constants.dart';
import 'package:flutter/material.dart';

/// This is a widget and a util to show snackbar
final class AppSnackBarUtil {
  const AppSnackBarUtil._();

  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String text, SnackBarStatusEnum status) {
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(_customSnackBar(text, status));
  }

  static SnackBar _customSnackBar(String text, SnackBarStatusEnum status) {
    return SnackBar(
      content: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: status.borderColor,
            ),
            child: Icon(
              status.icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
      backgroundColor: AppColorConstants.greyLight,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: RadiusConstants.smallBorderRadius,
        side: BorderSide(color: status.borderColor, width: 2),
      ),
    );
  }
}
