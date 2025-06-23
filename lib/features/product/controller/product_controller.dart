

import 'package:ecommerce_app/common/widgets/custom_snackbar.dart';
import 'package:ecommerce_app/features/product/model/category_product_model.dart';
import 'package:ecommerce_app/features/product/model/product_model.dart';
import 'package:ecommerce_app/features/product/repository/product_repository.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductController extends GetxController implements GetxService {
  final ProductRepository productRepository;

  ProductController({required this.productRepository});


  bool isLoading=false;


  List<CategoryProductModel> _categoryProductList = [];
  List<CategoryProductModel> get categoryProductList => _categoryProductList;

  Future<void> getCategoryWiseProduct(String categoryId) async{
    isLoading=true;
    _categoryProductList=[];
    update();
    Response response = await productRepository.getCategoryWiseProduct(categoryId);
    if(response.statusCode ==200){
      if(response.body["status"] != "Success") {
        showCustomSnackBar("${response.body["msg"]}");
      }
      isLoading=false;
      update();
      for(var i in response.body["products"]){
        _categoryProductList.add(CategoryProductModel.fromJson(i));
      }
    }else{
      isLoading=false;
      update();
    }
  }




  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  Future<void> getAllProducts() async{
    isLoading=true;
    update();
    Response response = await productRepository.getAllProduct();
    if(response.statusCode ==200){
      for(var i in response.body){
        _productList.add(ProductModel.fromJson(i));
        isLoading=false;
        update();
      }
    }else{
      isLoading=false;
      update();
    }
  }


}