import 'package:auto_route/auto_route.dart';
import 'package:ecommerceaudio/product/constants/svg_constants.dart';
import 'package:ecommerceaudio/product/navigation/app_router.dart';
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
      onTap: () {
        context.router.push(const BasketRoute());
      },
      child: SvgPicture.asset(
        SvgConstants.shoppingCart,
      ),
    );
  }
}
