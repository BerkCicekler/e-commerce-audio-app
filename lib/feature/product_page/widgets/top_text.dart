part of '../product_page.dart';

final class _TopText extends StatelessWidget {
  const _TopText(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'USD ${product.price}',
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          product.name.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
