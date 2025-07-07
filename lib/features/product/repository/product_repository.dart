import 'dart:io';

import 'package:ecommerce_app/features/product/model/category_product_model.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/data/api/api_client.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductRepository {
  final ApiClient apiClient;

  ProductRepository({required this.apiClient} );

  Future<Response> getCategoryWiseProduct(String categoryId)async{
    return await apiClient.getData(AppConstants.categoryWiseProductUrl+categoryId);

  }


  Future<Response> getAllProduct()async{
    return await apiClient.getData(AppConstants.allProductUrl);

  }

  Future<Response> getOrderDetails()async{
    return await apiClient.getData(AppConstants.orderListUrl);

  }

  Future<Response> placeOrder({Map<String, dynamic> ?body})async{
    return await apiClient.postData(AppConstants.placeOrderUri, body);

  }









}