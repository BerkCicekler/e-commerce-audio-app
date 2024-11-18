import 'package:ecommerceaudio/product/constants/font_constants.dart';
import 'package:ecommerceaudio/product/constants/radius_constants.dart';
import 'package:ecommerceaudio/product/constants/svg_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final class FormTextField extends StatelessWidget {
  FormTextField({
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;

  final _defaultOutlinedBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Color(0XFFBABABA),
    ),
    borderRadius: RadiusConstants.formInputCircularRadius,
  );

  final _hintStyle = const TextStyle(
    fontFamily: FontConstants.DmSans,
    fontWeight: FontWeight.w400,
    color: Color(0XFFBABABA),
    fontSize: 15,
  );
  final _textStyle = const TextStyle(
    fontFamily: FontConstants.DmSans,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 15,
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: _defaultOutlinedBorder,
        enabledBorder: _defaultOutlinedBorder,
        focusedBorder: _defaultOutlinedBorder,
        prefixIcon: SvgPicture.asset(
          SvgConstants.lock,
          width: 30,
          height: 15,
          fit: BoxFit.scaleDown,
        ),
        hintStyle: _hintStyle,
        isDense: true,
        contentPadding: const EdgeInsets.all(13),
        hintText: hintText,
      ),
      style: _textStyle,
      obscuringCharacter: '*',
      obscureText: obscureText,
    );
  }
}
