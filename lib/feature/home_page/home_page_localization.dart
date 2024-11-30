part of 'home_page.dart';

final class _HomePageLocalization {
  _HomePageLocalization._();

  static String hi(String name) => LocaleKeys.home_hi.tr(args: [name]);

  static final lookingFor = LocaleKeys.home_lookingFor.tr();

  static final textFieldHint = LocaleKeys.home_searchField.tr();

  static final shopNow = LocaleKeys.home_shopNow.tr();

  static final featuredProducts = LocaleKeys.home_featuredProducts.tr();

  static final seeAll = LocaleKeys.global_seeAll.tr();
}
