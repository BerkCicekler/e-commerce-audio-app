import 'package:ecommerceaudio/product/constants/enums/api_request_methods_enum.dart';
import 'package:ecommerceaudio/product/constants/enums/end_point_enums.dart';
import 'package:ecommerceaudio/product/models/request_models/basket_add_model.dart';
import 'package:ecommerceaudio/product/models/request_models/basket_update_model.dart';
import 'package:ecommerceaudio/product/models/response_models/basket_fetch_response_model.dart';
import 'package:ecommerceaudio/product/models/response_models/basket_id_response_model.dart';
import 'package:ecommerceaudio/product/services/network_service.dart';

class BasketService {
  Future<BasketFetchResponseModel> fetchBasket() async {
    final response = await NetworkService.instance.baseRequest(
      EndPointEnums.basketFetch,
      ApiRequestMethodsEnum.GET,
      {},
    );
    return BasketFetchResponseModel.fromJson(response.data);
  }

  Future<void> basketUpdate(BasketUpdateModel model) async {
    await NetworkService.instance.baseRequest(
      EndPointEnums.basketAddCountToItem,
      ApiRequestMethodsEnum.POST,
      model.toJson(),
    );
  }

  Future<BasketIdResponseModel> basketAddItem(BasketAddModel model) async {
    final response = await NetworkService.instance.baseRequest(
      EndPointEnums.basketAddItem,
      ApiRequestMethodsEnum.POST,
      model.toJson(),
    );
    return BasketIdResponseModel.fromJson(response.data);
  }

  Future<void> removeItem(BasketUpdateModel model) async {
    await NetworkService.instance.baseRequest(
      EndPointEnums.basketRemoveItem,
      ApiRequestMethodsEnum.delete,
      model.toJson(),
    );
  }

  Future<void> removeAllItems() async {
    await NetworkService.instance.baseRequest(
      EndPointEnums.basketRemoveAllItems,
      ApiRequestMethodsEnum.delete,
      {},
    );
  }
}
