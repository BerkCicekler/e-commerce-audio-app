part of '../home_page.dart';

final class _FeaturedHolder extends StatelessWidget {
  const _FeaturedHolder();

  @override
  Widget build(BuildContext context) {
    final featured = context.watch<FeaturedProductsCubit>().state;
    return SizedBox(
      height: 315,
      child: Padding(
        padding: AppPaddingConstants.pageConst,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const _TopHolder(),
            const SizedBox(
              height: 20,
            ),
            featured.products.length == 0
                ? const SizedBox.shrink()
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _HomePageLocalization.featuredProducts,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Text(
          _HomePageLocalization.seeAll,
          style: const TextStyle(
            fontSize: 14,
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
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(12),
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
              child: AppImageWidget.network(
                imageName: product.pictureName,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            'USD ${product.price}',
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
