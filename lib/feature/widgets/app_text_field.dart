import 'package:ecommerceaudio/product/constants/font_constants.dart';
import 'package:ecommerceaudio/product/constants/radius_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final class AppTextField extends StatelessWidget {
  AppTextField({
    required this.controller,
    this.hintText = '',
    this.svgIconPath,
    this.onTap,
    this.readonly = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.autoFocus = false,
    this.onSubmitted,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final String? svgIconPath;
  final void Function()? onTap;
  final bool readonly;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool autoFocus;
  final void Function(String)? onSubmitted;

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
    return SizedBox(
      height: 50,
      child: TextField(
        onSubmitted: onSubmitted,
        autofocus: autoFocus,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        readOnly: readonly,
        onTap: onTap,
        cursorColor: Colors.black,
        cursorWidth: 0.8,
        cursorHeight: 15,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: _defaultOutlinedBorder,
          enabledBorder: _defaultOutlinedBorder,
          focusedBorder: _defaultOutlinedBorder,
          prefixIcon: svgIconPath != null
              ? SvgPicture.asset(
                  svgIconPath!,
                  width: 30,
                  height: 15,
                  fit: BoxFit.scaleDown,
                )
              : null,
          hintStyle: _hintStyle,
          isDense: true,
          contentPadding: svgIconPath == null
              ? const EdgeInsets.all(12)
              : const EdgeInsets.all(1),
          hintText: hintText,
        ),
        style: _textStyle,
      ),
    );
  }
}
