import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerceaudio/feature/widgets/app_image_network.dart';
import 'package:ecommerceaudio/product/bloc/basket_bloc/basket_bloc.dart';
import 'package:ecommerceaudio/product/constants/app_color_constants.dart';
import 'package:ecommerceaudio/product/constants/app_padding_constants.dart';
import 'package:ecommerceaudio/product/constants/radius_constants.dart';
import 'package:ecommerceaudio/product/constants/svg_constants.dart';
import 'package:ecommerceaudio/product/init/language/locale_keys.g.dart';
import 'package:ecommerceaudio/product/models/basket_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'basket_page_localization.dart';
part 'widgets/app_bar.dart';
part 'widgets/checkout.dart';
part 'widgets/basket_items.dart';
part 'widgets/total_price.dart';

@RoutePage()
final class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: SafeArea(
        child: Padding(
          padding: AppPaddingConstants.pageConst.copyWith(bottom: 0),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _BasketItems(),
              Spacer(),
              _TotalPriceHolder(),
              SizedBox(height: 25),
              _CheckoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
