part of '../product_page.dart';

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Add To Cart"),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
    );
  }
}
