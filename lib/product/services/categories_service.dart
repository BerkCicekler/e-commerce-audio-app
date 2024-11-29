import 'package:ecommerceaudio/product/constants/enums/api_request_methods_enum.dart';
import 'package:ecommerceaudio/product/constants/enums/end_point_enums.dart';
import 'package:ecommerceaudio/product/models/response_models/categories_response_model.dart';
import 'package:ecommerceaudio/product/services/network_service.dart';

class CategoriesService {
  Future<CategoriesResponseModel> getCategories() async {
    final response = await NetworkService.instance
        .baseRequest(EndPointEnums.categories, ApiRequestMethodsEnum.GET, {});
    return CategoriesResponseModel.fromJson(response.data);
  }
}
