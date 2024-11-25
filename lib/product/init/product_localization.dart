import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';

/// Product localization manager
final class ProductLocalization extends EasyLocalization {
  /// Product localization constructor will wrap the [child] with EasyLocalization widget
  ProductLocalization({required super.child, super.key})
      : super(
          supportedLocales: appSupportedLocales,
          path: _localePath,
          fallbackLocale: const Locale('en', 'US'),
        );

  /// all the supported locales
  static final List<Locale> appSupportedLocales = [const Locale('en', 'US')];

  static const String _localePath = 'assets/translations';
}
