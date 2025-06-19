import 'package:get/get.dart';
import 'package:ecommerce_app/data/api/api_client.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  final ApiClient apiClient;

  HomeRepository({required this.apiClient} );


/*  Future<Response> getNewsData({int? page,String? sortBy,search})async{
    return await apiClient.getData("everything?q=$search&sortBy=$sortBy&pageSize=10&page=$page&apiKey=${AppConstants.token}");
  }

  Future<Response> getHeadlineData()async{
    return await apiClient.getData("top-headlines?sources=bbc-news&apiKey=${AppConstants.token}");
  }*/

  Future<Response> getSliderData()async{
    return await apiClient.getData(AppConstants.sliderUrl);
  }




}