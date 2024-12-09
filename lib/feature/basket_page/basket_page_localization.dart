part of 'basket_page.dart';

final class _BasketPageLocalization {
  static final appBarTitle = LocaleKeys.basket_appBarTitle.tr();

  static final checkoutButton = LocaleKeys.basket_checkoutText.tr();

  static String totalItems(int count) =>
      LocaleKeys.basket_totalItems.tr(args: [count.toString()]);
}
