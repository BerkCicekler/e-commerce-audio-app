import 'package:ecommerceaudio/product/models/basket_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'basket_state.freezed.dart';

@freezed
class BasketState with _$BasketState {
  const factory BasketState({
    required List<BasketItem> basketItems,
    required BasketStatus status,
  }) = _BasketState;
}

enum BasketStatus {
  initial,
  loading,
  success,
  error;
}
