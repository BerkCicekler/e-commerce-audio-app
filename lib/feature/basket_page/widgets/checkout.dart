part of '../basket_page.dart';

final class _CheckoutButton extends StatelessWidget {
  const _CheckoutButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(_BasketPageLocalization.checkoutButton),
          SvgPicture.asset(SvgConstants.right),
        ],
      ),
    );
  }
}
