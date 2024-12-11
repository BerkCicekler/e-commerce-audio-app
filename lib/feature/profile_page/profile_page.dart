import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerceaudio/feature/widgets/circle_profile_picture.dart';
import 'package:ecommerceaudio/product/bloc/auth_manager_bloc/auth_manager_bloc.dart';
import 'package:ecommerceaudio/product/cache/refresh_token_cache.dart';
import 'package:ecommerceaudio/product/constants/app_color_constants.dart';
import 'package:ecommerceaudio/product/constants/app_padding_constants.dart';
import 'package:ecommerceaudio/product/init/language/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'profile_actions_model.dart';
part 'widgets/app_bar.dart';
part 'widgets/profile_actions.dart';
part 'widgets/profile_info.dart';
part 'profile_page_localization.dart';

@RoutePage()
final class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBar(),
      body: Column(
        children: [
          _ProfileInfoHolder(),
          Divider(),
          SizedBox(height: 10),
          _ProfileActions(),
        ],
      ),
    );
  }
}
