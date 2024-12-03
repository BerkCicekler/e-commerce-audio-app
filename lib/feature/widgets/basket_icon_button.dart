import 'package:ecommerceaudio/product/constants/svg_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// This is a Icon button to navigate to the
/// basket page |
/// Mainly created for appbar
final class BasketIconButton extends StatelessWidget {
  const BasketIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SvgPicture.asset(
        SvgConstants.shoppingCart,
      ),
    );
  }
}
