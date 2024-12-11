part of '../../filtered_results_page.dart';

final class _Products extends StatefulWidget {
  const _Products();

  @override
  State<_Products> createState() => _ProductsState();
}

final class _ProductsState extends State<_Products> with _ProductsMixin {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<FilteredSearchBloc>();
    return Expanded(
      child: Container(
        padding: AppPaddingConstants.pageConst,
        decoration: BoxDecoration(
          color: AppColorConstants.greyLight2,
          borderRadius: BorderRadius.only(
            topLeft: RadiusConstants.largeRadius,
            topRight: RadiusConstants.largeRadius,
          ),
        ),
        child: GridView.builder(
          controller: _scrollController,
          itemCount: bloc.state.products.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 280,
            childAspectRatio: 0.65,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (_, i) {
            return IntrinsicHeight(
              child: _ProductHolder(bloc.state.products[i]),
            );
          },
        ),
      ),
    );
  }
}

final class _ProductHolder extends StatelessWidget {
  const _ProductHolder(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(ProductRoute(product: product));
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: RadiusConstants.mediumBorderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: SizedBox(
                width: 140,
                child: AppImageWidget.network(
                  imageName: product.pictureName,
                ),
              ),
            ),
            Text(
              product.name,
              style: const TextStyle(fontSize: 15.6),
            ),
            const Spacer(),
            Text(
              'USD ${product.price}',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
            ),
            const Spacer(
              flex: 3,
            ),
            const Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
                SizedBox(width: 1),
                Text(
                  '4.6',
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(width: 10),
                Text(
                  '86 Reviews',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
