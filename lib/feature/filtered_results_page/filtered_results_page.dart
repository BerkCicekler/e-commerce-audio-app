import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerceaudio/feature/widgets/app_image_network.dart';
import 'package:ecommerceaudio/feature/widgets/basket_icon_button.dart';
import 'package:ecommerceaudio/feature/widgets/filter_bottom_sheet/filter_bottom_sheet.dart';
import 'package:ecommerceaudio/product/bloc/filtered_results_bloc/filtered_results_bloc.dart';
import 'package:ecommerceaudio/product/constants/app_color_constants.dart';
import 'package:ecommerceaudio/product/constants/app_padding_constants.dart';
import 'package:ecommerceaudio/product/constants/enums/filter_sort_by_enums.dart';
import 'package:ecommerceaudio/product/constants/radius_constants.dart';
import 'package:ecommerceaudio/product/constants/svg_constants.dart';
import 'package:ecommerceaudio/product/init/language/locale_keys.g.dart';
import 'package:ecommerceaudio/product/models/product.dart';
import 'package:ecommerceaudio/product/models/request_models/filter_request_model.dart';
import 'package:ecommerceaudio/product/navigation/app_router.dart';
import 'package:ecommerceaudio/product/services/search_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'filtered_results_localization.dart';
part 'widgets/app_bar.dart';
part 'widgets/filter.dart';
part 'widgets/products/products.dart';
part 'widgets/products/products_mixin.dart';
part 'widgets/titles.dart';

@RoutePage()
final class FilteredResultsPage extends StatelessWidget {
  const FilteredResultsPage({
    required this.searchText,
    super.key,
  });

  final String searchText;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FilteredSearchBloc(
        searchService: SearchService(),
        searchText: searchText,
      )..add(FilteredResultsOnReachBottomEvent()),
      child: Scaffold(
        appBar: const _AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  AppPaddingConstants.pageConst.copyWith(top: 0, bottom: 0),
              child: const _Titles(),
            ),
            const SizedBox(height: 15),
            Padding(
              padding:
                  AppPaddingConstants.pageConst.copyWith(top: 0, bottom: 0),
              child: const _FiltersRow(),
            ),
            const SizedBox(height: 15),
            const _Products(),
          ],
        ),
      ),
    );
  }
}
