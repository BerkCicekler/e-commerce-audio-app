import 'package:auto_route/annotations.dart';
import 'package:ecommerceaudio/feature/widgets/app_text_field.dart';
import 'package:ecommerceaudio/product/bloc/auth_manager_bloc/auth_manager_bloc.dart';
import 'package:ecommerceaudio/product/bloc/categories_cubit/categories_cubit.dart';
import 'package:ecommerceaudio/product/bloc/featured_products_cubit/featured_products_cubit.dart';
import 'package:ecommerceaudio/product/constants/app_color_constants.dart';
import 'package:ecommerceaudio/product/constants/app_image_constants.dart';
import 'package:ecommerceaudio/product/constants/app_padding_constants.dart';
import 'package:ecommerceaudio/product/constants/radius_constants.dart';
import 'package:ecommerceaudio/product/constants/svg_constants.dart';
import 'package:ecommerceaudio/product/models/product.dart';
import 'package:ecommerceaudio/product/services/search_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'home_page_mixin.dart';
part 'widgets/app_bar.dart';
part 'widgets/welcome_text.dart';
part 'widgets/text_field.dart';
part 'widgets/scrollable_containers/scrollable_containers.dart';
part 'widgets/scrollable_containers/scrollable_containers_mixin.dart';
part 'widgets/featured_holder.dart';

@RoutePage()
final class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final class _HomePageState extends State<HomePage> with _HomePageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _featuredProductsCubit,
      child: Scaffold(
        appBar: const _AppBar(),
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                const _WelcomeText(),
                const SizedBox(height: 20),
                const _TextField(),
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: AppColorConstants.greyLight,
                    borderRadius: BorderRadius.only(
                      topLeft: RadiusConstants.largeRadius,
                      topRight: RadiusConstants.largeRadius,
                    ),
                  ),
                  child: const Column(
                    children: [
                      _ScrollAbleContainers(),
                      _FeaturedHolder(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
