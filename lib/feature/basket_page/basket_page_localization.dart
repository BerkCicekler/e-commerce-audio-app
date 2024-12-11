part of 'basket_page.dart';

final class _BasketPageLocalization {
  static final appBarTitle = LocaleKeys.basket_appBarTitle.tr();

  static final checkoutButton = LocaleKeys.basket_checkoutText.tr();

  static String totalItems(int count) =>
      LocaleKeys.basket_totalItems.tr(args: [count.toString()]);

  static final dialogTitle = LocaleKeys.global_areYouSure.tr();
  static final dialogContext = LocaleKeys.basket_clearBasketDialog.tr();
  static final cancel = LocaleKeys.global_cancel.tr();
  static final ok = LocaleKeys.global_ok.tr();
}
