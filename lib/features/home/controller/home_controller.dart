import 'package:ecommerce_app/features/home/model/category_model.dart';
import 'package:ecommerce_app/features/home/model/slider_model.dart';
import 'package:ecommerce_app/features/product/controller/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/features/home/repository/home_repository.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart' show RefreshController;

class HomeController extends GetxController implements GetxService {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});





  bool isLoading = false;
  bool isLoadingMore = false;


  SliderModel ?_sliderModel;
  SliderModel? get sliderModel => _sliderModel;

  // List<Slider> _sliderList=[];


  Future<void> getSliderData()async{
    isLoading=true;
    update();

    Response response =await homeRepository.getSliderData();

    if(response.statusCode==200){
      _sliderModel=SliderModel.fromJson(response.body);

      isLoading=false;
      update();
    }else{
      isLoading=false;
      update();
    }

  }




  List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;



  Future<void> getCategoryData() async {
    isLoading = true;
    update();

    Response response = await homeRepository.getCategoryData();

    if (response.statusCode == 200) {
      // _categoryList = (response.body as List).map((category) => CategoryModel.fromJson(category)).toList();

      for(var i in response.body){
        _categoryList.add(CategoryModel.fromJson(i));
      }
      isLoading = false;
      update();
    } else {
      isLoading = false;
      update();
    }



  }




  @override
  void onInit() {
    // TODO: implement onInit
    getSliderData();
    getCategoryData();
    Get.find<ProductController>().getAllProducts();

    super.onInit();
  }

}