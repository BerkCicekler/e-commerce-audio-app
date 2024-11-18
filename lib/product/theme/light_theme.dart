import 'package:ecommerceaudio/product/constants/app_color_constants.dart';
import 'package:ecommerceaudio/product/constants/font_constants.dart';
import 'package:ecommerceaudio/product/constants/radius_constants.dart';
import 'package:flutter/material.dart';

final class LightTheme {
  final theme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      onPrimary: AppColorConstants.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
    ),
    scaffoldBackgroundColor: AppColorConstants.scaffoldBackground,
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorConstants.primaryColor,
        textStyle: const TextStyle(
          fontSize: 16,
          fontFamily: FontConstants.DmSans,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: RadiusConstants.formInputCircularRadius,
        ),
      ),
    ),
  );
}
