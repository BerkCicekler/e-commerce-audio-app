import 'package:auto_route/annotations.dart';
import 'package:ecommerceaudio/feature/widgets/basket_icon_button.dart';
import 'package:ecommerceaudio/product/constants/app_color_constants.dart';
import 'package:ecommerceaudio/product/constants/app_image_constants.dart';
import 'package:ecommerceaudio/product/constants/app_padding_constants.dart';
import 'package:ecommerceaudio/product/constants/radius_constants.dart';
import 'package:ecommerceaudio/product/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

part 'widgets/app_bar.dart';
part 'widgets/top_text.dart';
part 'widgets/tab_bar.dart';
part 'widgets/tab_bar_views/over_view_tab_view.dart';
part 'widgets/button.dart';

@RoutePage()
final class ProductPage extends StatelessWidget {
  /// [product] is the item that will be shown in the page
  const ProductPage({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: Padding(
        padding: AppPaddingConstants.pageConst,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TopText(product),
            const Expanded(child: _Tabbar()),
            const SizedBox(
              height: 20,
            ),
            const _AddToCartButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
