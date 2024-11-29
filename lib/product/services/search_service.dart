import 'package:ecommerceaudio/product/constants/enums/api_request_methods_enum.dart';
import 'package:ecommerceaudio/product/constants/enums/end_point_enums.dart';
import 'package:ecommerceaudio/product/models/request_models/filter_request_model.dart';
import 'package:ecommerceaudio/product/models/response_models/product_response_model.dart';
import 'package:ecommerceaudio/product/services/network_service.dart';

class SearchService {
  Future<ProductResponseModel> SearchProducts(
      FilterRequestModel filterRequestModel) async {
    final response = await NetworkService.instance.baseRequest(
      EndPointEnums.shopFeatured,
      ApiRequestMethodsEnum.GET,
      filterRequestModel.toJson(),
    );
    return ProductResponseModel.fromJson(response.data);
  }
}
