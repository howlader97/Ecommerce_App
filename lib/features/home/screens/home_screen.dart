import 'package:ecommerce_app/common/widgets/carosel_slider.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/product/controller/product_controller.dart';
import 'package:ecommerce_app/features/product/screens/category_wise_product_screen.dart';
import 'package:ecommerce_app/features/product/screens/product_details_screen.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
 const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(
        child: Text('Ecommerce',style: TextStyle(color: AppColors.primary),),
      ),),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: GetBuilder<HomeController>(
              builder: (homeController) {
                return GetBuilder<ProductController>(
                  builder: (productController) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        homeController.sliderModel==null?const SizedBox(child: Text('nothing is here'),): ProductImageCarousel(
                          imageUrls: homeController.sliderModel!.sliders!.map((index) => index.image!)
                              .toList(),
                        ),
                        const Text('All data',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                        const SizedBox(height: 4,),
                        SizedBox(height: 270,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.73
                            ),
                          //  itemCount: homeController.categoryList.length,
                            itemCount: homeController.categoryList.length,
                            itemBuilder:(context,index){
                              return InkWell(
                                onTap: (){
                                  productController.getCategoryWiseProduct("${homeController.categoryList[index].catCode}");
                                  Get.to(const CategoryWiseProductScreen());
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                  Container(
                                    width: 250,
                                    height: 90,
                                    child: Image.network("${AppConstants.imageUrl}${homeController.categoryList[index].image}",fit: BoxFit.cover,),

                                  ),
                                    FittedBox(child: Text("${homeController.categoryList[index].name}",style: const TextStyle(fontSize: 12),maxLines: 1,)),
                                  ],

                                ),
                              );
                            }),
                        ),
                        const SizedBox(height: 6,),
                        const Text('All Products',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                        const SizedBox(height: 6,),
                        GridView.builder(
                          shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: .5,
                                childAspectRatio: 0.73
                            ),
                            //  itemCount: homeController.categoryList.length,
                            itemCount: productController.productList.length,
                            itemBuilder:(context,index){
                              return InkWell(
                                onTap: (){
                                  Get.to(ProductDetailsScreen(productModel: productController.productList[index]));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        width: 250,
                                        height: 90,
                                        child: Image.network("${AppConstants.imageUrl}${productController.productList[index].mainImage}",fit: BoxFit.cover,),

                                      ),
                                    ),
                                    Text("${productController.productList[index].name}",style: const TextStyle(fontSize: 12),maxLines: 1,),
                                    Text("${productController.productList[index].sellPrice}",style: const TextStyle(fontSize: 12),maxLines: 1,),

                                  ],

                                ),
                              );
                            }),
                      ],
                    );
                  }
                );
              }
          ),
        ),
      ),
    );
  }
}
