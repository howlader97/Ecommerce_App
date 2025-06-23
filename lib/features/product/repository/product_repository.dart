import 'package:get/get.dart';
import 'package:ecommerce_app/data/api/api_client.dart';
import 'package:ecommerce_app/utils/app_constants.dart';

class ProductRepository{
  final ApiClient apiClient;

  ProductRepository({required this.apiClient} );

  
  Future<Response> getCategoryWiseProduct(String categoryId) async{
    return await apiClient.getData(AppConstants.categoryWiseProductUrl+categoryId);
  }


}