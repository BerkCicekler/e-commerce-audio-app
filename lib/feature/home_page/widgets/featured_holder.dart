part of '../home_page.dart';

final class _FeaturedHolder extends StatelessWidget {
  const _FeaturedHolder();

  @override
  Widget build(BuildContext context) {
    final featured = context.watch<FeaturedProductsCubit>().state;
    print(featured.products);
    return SizedBox(
      height: 315,
      child: Padding(
        padding: AppPaddingConstants.pageConst,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _TopHolder(),
            SizedBox(
              height: 20,
            ),
            featured.products.length == 0
                ? SizedBox.shrink()
                : Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: featured.products.length,
                      itemBuilder: (context, index) {
                        return _FeaturedItemHolder(
                          product: featured.products[index],
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

final class _TopHolder extends StatelessWidget {
  const _TopHolder();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Featured Products',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Text(
          'See All',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: AppColorConstants.greyDark,
          ),
        ),
      ],
    );
  }
}

final class _FeaturedItemHolder extends StatelessWidget {
  const _FeaturedItemHolder({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Container(
      width: width * 0.4,
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: RadiusConstants.mediumBorderRadius,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              width: width * .3,
              child: Image.network(
                'http://10.0.2.2:8080/api/v1/image/${product.pictureName}',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            product.name,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            'USD ${product.price}',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
