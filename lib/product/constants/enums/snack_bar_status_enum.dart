import 'package:ecommerceaudio/product/constants/app_color_constants.dart';
import 'package:flutter/material.dart';

enum SnackBarStatusEnum {
  success(AppColorConstants.primaryColor, Icons.done),
  error(Colors.red, Icons.close);

  final Color borderColor;
  final IconData icon;
  const SnackBarStatusEnum(this.borderColor, this.icon);
}
