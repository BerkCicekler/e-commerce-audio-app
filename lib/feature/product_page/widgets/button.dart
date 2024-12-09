part of '../product_page.dart';

final class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<BasketBloc>().add(BasketAddItemEvent(product));
      },
      child: Text("Add To Cart"),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
    );
  }
}
