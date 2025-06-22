import 'package:ecommerce_app/features/home/model/category_model.dart';
import 'package:ecommerce_app/features/home/model/slider_model.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/features/home/repository/home_repository.dart';

class HomeController extends GetxController implements GetxService {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});


  bool isLoading = false;
  bool isLoadingMore = false;


  SliderModel ?_sliderModel;
  SliderModel? get sliderModel => _sliderModel;

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
//get categoryData

  List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;

  Future<void> getCategoryData() async{
    isLoading=false;
    update();
    Response response=await homeRepository.getCategoryData();
    if(response.statusCode == 200){
      for(var i in response.body){
        _categoryList.add(CategoryModel.fromJson(i));
        isLoading=true;
        update();
      }
    }else{
      isLoading=true;
      update();
    }
  }

  @override
  void onInit() {
    getSliderData();
    getCategoryData();
    super.onInit();
  }


}