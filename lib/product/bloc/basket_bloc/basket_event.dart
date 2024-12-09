part of 'basket_bloc.dart';

sealed class BasketEvent {}

final class BasketFetchEvent extends BasketEvent {}

final class BasketAddItemEvent extends BasketEvent {
  BasketAddItemEvent(this.product);

  final Product product;
}

final class BasketUpdateItemEvent extends BasketEvent {
  BasketUpdateItemEvent(this.basketItem, this.count);

  final BasketItem basketItem;
  final int count;
}

final class BasketRemoveItemEvent extends BasketEvent {
  BasketRemoveItemEvent(this.basketItem);

  final BasketItem basketItem;
}

final class BasketClearAllEvent extends BasketEvent {}
