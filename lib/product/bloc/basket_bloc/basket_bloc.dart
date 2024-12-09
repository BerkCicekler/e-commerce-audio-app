import 'package:ecommerceaudio/product/bloc/basket_bloc/basket_state.dart';
import 'package:ecommerceaudio/product/models/basket_item.dart';
import 'package:ecommerceaudio/product/models/product.dart';
import 'package:ecommerceaudio/product/models/request_models/basket_add_model.dart';
import 'package:ecommerceaudio/product/models/request_models/basket_update_model.dart';
import 'package:ecommerceaudio/product/services/basket_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

part 'basket_event.dart';

/// This is a bloc element for managing the user's basket
final class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final BasketService basketService;
  BasketBloc({required this.basketService})
      : super(
          const BasketState(
            basketItems: [],
            status: BasketStatus.initial,
          ),
        ) {
    on<BasketFetchEvent>(_fetchBasket);
    on<BasketAddItemEvent>(_addItemToBasket);
    on<BasketUpdateItemEvent>(_updateItem);
    on<BasketRemoveItemEvent>(_removeItem);
    on<BasketClearAllEvent>(_clearBasket);
  }

  int get totalPrice {
    return state.basketItems.fold<int>(0, (val, e) {
      return (e.product.price * e.count) + val;
    });
  }

  Future<void> _fetchBasket(
    BasketFetchEvent event,
    Emitter<BasketState> emit,
  ) async {
    emit(const BasketState(basketItems: [], status: BasketStatus.loading));
    try {
      final response = await basketService.fetchBasket();
      emit(
        BasketState(
          basketItems: response.basket,
          status: BasketStatus.success,
        ),
      );
    } catch (e) {
      Logger().e(e);
    }
  }

  Future<void> _addItemToBasket(
    BasketAddItemEvent event,
    Emitter<BasketState> emit,
  ) async {
    try {
      final response =
          await basketService.basketAddItem(BasketAddModel(event.product.id));
      emit(
        state.copyWith(
          basketItems: [
            BasketItem(response.id, event.product, 1),
            ...state.basketItems,
          ],
        ),
      );
    } catch (e) {
      Logger().e(e);
      emit(state.copyWith(status: BasketStatus.error));
    }
  }

  Future<void> _updateItem(
    BasketUpdateItemEvent event,
    Emitter<BasketState> emit,
  ) async {
    if (event.basketItem.count + event.count < 1) {
      return;
    }
    try {
      await basketService.basketUpdate(
        BasketUpdateModel(event.basketItem.id, event.count),
      );
      final indexOfBasketItem = state.basketItems.indexOf(event.basketItem);
      final newBasket = state.basketItems.toList();
      newBasket[indexOfBasketItem] = BasketItem(
        event.basketItem.id,
        event.basketItem.product,
        event.basketItem.count + event.count,
      );
      emit(state.copyWith(basketItems: newBasket));
    } catch (e) {
      Logger().e(e);
    }
  }

  Future<void> _removeItem(
    BasketRemoveItemEvent event,
    Emitter<BasketState> emit,
  ) async {
    try {
      await basketService.removeItem(BasketUpdateModel(event.basketItem.id, 0));
      final tempBasketItems = state.basketItems.toList()
        ..removeWhere((e) => e == event.basketItem);
      emit(state.copyWith(basketItems: tempBasketItems));
    } catch (e) {
      Logger().e(e);
    }
  }

  Future<void> _clearBasket(
    BasketClearAllEvent event,
    Emitter<BasketState> emit,
  ) async {
    try {
      await basketService.removeAllItems();
      emit(state.copyWith(basketItems: []));
    } catch (e) {
      Logger().e(e);
    }
  }
}
