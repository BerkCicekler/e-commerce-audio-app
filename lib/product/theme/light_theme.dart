import 'package:ecommerceaudio/product/constants/app_color_constants.dart';
import 'package:ecommerceaudio/product/constants/font_constants.dart';
import 'package:ecommerceaudio/product/constants/radius_constants.dart';
import 'package:ecommerceaudio/product/constants/svg_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    fontFamily: FontConstants.DmSans,
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
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (context) => SvgPicture.asset(SvgConstants.left),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColorConstants.dividerColor,
    ),
  );
}
