import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerceaudio/product/bloc/auth_manager_bloc/auth_manager_bloc.dart';
import 'package:ecommerceaudio/product/init/product_blocs.dart';
import 'package:ecommerceaudio/product/init/product_initialization.dart';
import 'package:ecommerceaudio/product/init/product_localization.dart';
import 'package:ecommerceaudio/product/navigation/app_router.dart';
import 'package:ecommerceaudio/product/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await ProductInitialization.Init();
  runApp(
    ProductLocalization(
      child: ProductBlocsInitialization(
        child: const _MyApp(),
      ),
    ),
  );
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(
        reevaluateListenable: ReevaluateListenable.stream(
          context.read<AuthManagerBloc>().stream,
        ),
      ),
      title: 'Audio E Commerce',
      theme: LightTheme().theme,
      themeMode: ThemeMode.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
