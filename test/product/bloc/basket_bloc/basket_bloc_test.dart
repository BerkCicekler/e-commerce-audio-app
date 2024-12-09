import 'package:bloc_test/bloc_test.dart';
import 'package:ecommerceaudio/product/bloc/basket_bloc/basket_bloc.dart';
import 'package:ecommerceaudio/product/bloc/basket_bloc/basket_state.dart';
import 'package:ecommerceaudio/product/models/basket_item.dart';
import 'package:ecommerceaudio/product/models/product.dart';
import 'package:ecommerceaudio/product/models/request_models/basket_add_model.dart';
import 'package:ecommerceaudio/product/models/request_models/basket_update_model.dart';
import 'package:ecommerceaudio/product/models/response_models/basket_fetch_response_model.dart';
import 'package:ecommerceaudio/product/models/response_models/basket_id_response_model.dart';
import 'package:ecommerceaudio/product/services/basket_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

final class MockBasketService extends Mock implements BasketService {}

void main() {
  late MockBasketService mockBasketService;
  late BasketItem dummyBasketItem;
  setUpAll(() {
    mockBasketService = MockBasketService();
    registerFallbackValue(BasketAddModel(''));
    registerFallbackValue(BasketUpdateModel('', 0));
  });

  setUp(() {
    mockBasketService = MockBasketService();
    dummyBasketItem = BasketItem('1', Product('1', '', '', 1), 1);
  });

  blocTest<BasketBloc, BasketState>(
    'Initial values are correct',
    build: () => BasketBloc(basketService: mockBasketService),
    verify: (bloc) {
      expect(
        bloc.state,
        const BasketState(
          basketItems: [],
          status: BasketStatus.initial,
        ),
      );
    },
  );

  blocTest<BasketBloc, BasketState>(
    'Fetch basket setts basketItems on fetch',
    build: () => BasketBloc(
      basketService: mockBasketService,
    ),
    act: (bloc) => bloc.add(BasketFetchEvent()),
    setUp: () {
      when(() => mockBasketService.fetchBasket()).thenAnswer(
        (_) async => BasketFetchResponseModel(
          [dummyBasketItem],
        ),
      );
    },
    verify: (bloc) {
      expect(bloc.state.basketItems[0], dummyBasketItem);
      verify(() => mockBasketService.fetchBasket()).called(1);
    },
  );

  blocTest<BasketBloc, BasketState>(
    'Add to basket event adds given product to state',
    build: () => BasketBloc(
      basketService: mockBasketService,
    ),
    act: (bloc) => bloc.add(BasketAddItemEvent(dummyBasketItem.product)),
    setUp: () {
      when(() => mockBasketService.basketAddItem(any())).thenAnswer(
        (_) async => BasketIdResponseModel('123'),
      );
    },
    verify: (bloc) {
      expect(
        bloc.state.basketItems[0],
        BasketItem('123', dummyBasketItem.product, 1),
      );
      verify(() => mockBasketService.basketAddItem(any())).called(1);
    },
  );

  group('Update Item event Tests', () {
    blocTest<BasketBloc, BasketState>(
      "Update item on increase count by 1 of the basketItem's count",
      build: () => BasketBloc(
        basketService: mockBasketService,
      ),
      act: (bloc) {
        /// first we have to have some data(aka basketItem)
        bloc.add(BasketFetchEvent());
        // increase the count 1
        bloc.add(BasketUpdateItemEvent(dummyBasketItem, 1));
      },
      setUp: () {
        when(() => mockBasketService.fetchBasket()).thenAnswer(
          (_) async => BasketFetchResponseModel([dummyBasketItem]),
        );
        when(() => mockBasketService.basketUpdate(any()))
            .thenAnswer((_) async => {});
      },
      verify: (bloc) {
        expect(
          bloc.state.basketItems[0].count,
          2,
        );
        verify(() => mockBasketService.basketUpdate(any())).called(1);
      },
    );

    blocTest<BasketBloc, BasketState>(
      """Update item on decrease count by 1 of the basketItem's count
        shouldn't work 
      """,
      build: () => BasketBloc(
        basketService: mockBasketService,
      ),
      act: (bloc) {
        /// first we have to have some data(aka basketItem)
        bloc.add(BasketFetchEvent());
        // increase the count 1
        bloc.add(BasketUpdateItemEvent(dummyBasketItem, -1));
      },
      setUp: () {
        when(() => mockBasketService.fetchBasket()).thenAnswer(
          (_) async => BasketFetchResponseModel([dummyBasketItem]),
        );
        when(() => mockBasketService.basketUpdate(any()))
            .thenAnswer((_) async => {});
      },
      verify: (bloc) {
        expect(
          bloc.state.basketItems[0].count,
          1,
        );
        verifyNever(() => mockBasketService.basketUpdate(any()));
      },
    );
  });

  blocTest<BasketBloc, BasketState>(
    'Remove an item',
    build: () => BasketBloc(
      basketService: mockBasketService,
    ),
    act: (bloc) {
      bloc.add(BasketFetchEvent());
      bloc.add(BasketRemoveItemEvent(dummyBasketItem));
    },
    setUp: () {
      when(() => mockBasketService.fetchBasket()).thenAnswer(
        (_) async => BasketFetchResponseModel(
          [dummyBasketItem],
        ),
      );
      when(() => mockBasketService.removeItem(any())).thenAnswer(
        (_) async => {},
      );
    },
    verify: (bloc) {
      expect(bloc.state.basketItems.contains(dummyBasketItem), false);
      verify(() => mockBasketService.removeItem(any())).called(1);
    },
  );

  blocTest<BasketBloc, BasketState>(
    'Remove all items',
    build: () => BasketBloc(
      basketService: mockBasketService,
    ),
    act: (bloc) {
      bloc.add(BasketFetchEvent());
      bloc.add(BasketClearAllEvent());
    },
    setUp: () {
      when(() => mockBasketService.fetchBasket()).thenAnswer(
        (_) async => BasketFetchResponseModel(
          [dummyBasketItem, dummyBasketItem],
        ),
      );
      when(() => mockBasketService.removeAllItems()).thenAnswer(
        (_) async => {},
      );
    },
    verify: (bloc) {
      expect(bloc.state.basketItems, <BasketItem>[]);
      verify(() => mockBasketService.removeAllItems()).called(1);
    },
  );
}
