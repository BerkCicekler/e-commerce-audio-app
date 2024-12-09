part of '../basket_page.dart';

final class _BasketItems extends StatelessWidget {
  const _BasketItems();

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<BasketBloc>();
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: bloc.state.basketItems.length,
      itemBuilder: (ctx, i) {
        return _BasketItemHolder(bloc.state.basketItems[i]);
      },
    );
  }
}

final class _BasketItemHolder extends StatelessWidget {
  const _BasketItemHolder(this.basketItem);

  final BasketItem basketItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          _ImageHolder(basketItem),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  basketItem.product.name,
                  style: const TextStyle(fontSize: 17),
                ),
                Text(
                  'USD ${basketItem.product.price}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: _ProductCountEditor(basketItem)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final class _ImageHolder extends StatelessWidget {
  const _ImageHolder(this.basketItem);

  final BasketItem basketItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: AppColorConstants.greyLight,
        borderRadius: RadiusConstants.smallBorderRadius,
      ),
      child: Center(
        child: SizedBox(
          width: 75,
          height: 75,
          child:
              AppImageWidget.network(imageName: basketItem.product.pictureName),
        ),
      ),
    );
  }
}

final class _ProductCountEditor extends StatelessWidget {
  const _ProductCountEditor(this.basketItem);

  final BasketItem basketItem;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BasketBloc>();
    return Row(
      children: [
        _customContainer(Icons.remove, () {
          bloc.add(BasketUpdateItemEvent(basketItem, -1));
        }),
        const SizedBox(width: 30),
        Text(
          basketItem.count.toString(),
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(width: 30),
        _customContainer(Icons.add, () {
          bloc.add(BasketUpdateItemEvent(basketItem, 1));
        }),
        const Spacer(),
        InkWell(
          onTap: () {
            bloc.add(BasketRemoveItemEvent(basketItem));
          },
          child: SvgPicture.asset(
            SvgConstants.trash,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _customContainer(IconData icon, void Function() onTap) {
    return InkWell(
      borderRadius: RadiusConstants.smallBorderRadius,
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: RadiusConstants.smallBorderRadius,
        ),
        child: Center(child: Icon(icon)),
      ),
    );
  }
}
