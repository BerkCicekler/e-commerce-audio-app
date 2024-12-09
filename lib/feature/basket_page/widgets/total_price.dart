part of '../basket_page.dart';

final class _TotalPriceHolder extends StatelessWidget {
  const _TotalPriceHolder();

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<BasketBloc>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _BasketPageLocalization.totalItems(bloc.state.basketItems.length),
        ),
        Text(
          'USD ${bloc.totalPrice}',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ],
    );
  }
}
