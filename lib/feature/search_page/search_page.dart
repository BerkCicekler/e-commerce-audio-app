import 'package:auto_route/auto_route.dart';
import 'package:ecommerceaudio/feature/widgets/app_text_field.dart';
import 'package:ecommerceaudio/feature/widgets/basket_icon_button.dart';
import 'package:ecommerceaudio/product/cache/search_history_cache.dart';
import 'package:ecommerceaudio/product/constants/app_padding_constants.dart';
import 'package:ecommerceaudio/product/constants/svg_constants.dart';
import 'package:ecommerceaudio/product/models/cache_models/search_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

part 'search_page_view_model.dart';
part 'widgets/search_field.dart';
part 'widgets/last_search.dart';
part 'widgets/app_bar.dart';

@RoutePage()
final class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

final class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SearchViewModel(),
      child: Scaffold(
        appBar: _AppBar(),
        body: const Padding(
          padding: AppPaddingConstants.pageConst,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SearchField(),
              SizedBox(height: 25),
              _HistoryHolder(),
            ],
          ),
        ),
      ),
    );
  }
}
