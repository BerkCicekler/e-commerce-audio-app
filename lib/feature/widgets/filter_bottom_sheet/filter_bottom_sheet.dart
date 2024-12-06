import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerceaudio/feature/widgets/app_text_field.dart';
import 'package:ecommerceaudio/product/constants/app_color_constants.dart';
import 'package:ecommerceaudio/product/constants/app_padding_constants.dart';
import 'package:ecommerceaudio/product/constants/enums/filter_sort_by_enums.dart';
import 'package:ecommerceaudio/product/constants/radius_constants.dart';
import 'package:ecommerceaudio/product/constants/svg_constants.dart';
import 'package:ecommerceaudio/product/init/language/locale_keys.g.dart';
import 'package:ecommerceaudio/product/models/request_models/filter_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

part 'filter_bottom_sheet_view_model.dart';
part 'filter_bottom_sheet_localization.dart';
part 'widgets/top.dart';
part 'widgets/sort_by.dart';
part 'widgets/price_range.dart';
part 'widgets/complete_button.dart';

final class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({required this.filterModel, super.key});

  final FilterRequestModel filterModel;

  static Future<FilterRequestModel?> showModal(
      BuildContext context, FilterRequestModel filterModel) {
    return showModalBottomSheet<FilterRequestModel?>(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
            padding: MediaQuery.of(_).viewInsets,
            child: FilterBottomSheet(filterModel: filterModel));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _FilterBottomSheetViewModel(filterModel),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: RadiusConstants.largeRadius,
            topRight: RadiusConstants.largeRadius,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: AppPaddingConstants.pageConst.copyWith(bottom: 0),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Top(),
                SizedBox(height: 30),
                _SortByHolder(),
                SizedBox(height: 30),
                _PriceRange(),
                SizedBox(height: 30),
                _CompleteButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final class _BodyTextHead extends StatelessWidget {
  const _BodyTextHead(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18),
    );
  }
}
