import 'package:ecommerce_app/features/product/controller/product_controller.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWiseProductScreen extends StatefulWidget {
  const CategoryWiseProductScreen({super.key});

  @override
  State<CategoryWiseProductScreen> createState() => _CategoryWiseProductScreenState();
}

class _CategoryWiseProductScreenState extends State<CategoryWiseProductScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(centerTitle: true,
        title:Text('CategoryWiseProduct',style: TextStyle(color: Colors.indigoAccent),),),
      
      body: SingleChildScrollView(
        child: GetBuilder<ProductController>(
          builder: (productController) {
            return Column(
                children: [
                 productController.isLoading?const Center(child: CircularProgressIndicator()):productController.categoryProductList.isEmpty?const Center(child: Text('no product found')):
                 GridView.builder(
                    shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.73
                      ),
                      //  itemCount: homeController.categoryList.length,
                      itemCount: productController.categoryProductList.length,
                      itemBuilder:(context,index){
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 250,
                              height: 90,
                              child: Image.network("${AppConstants.imageUrl}${productController.categoryProductList[index].bigImage}",fit: BoxFit.cover,),

                            ),
                            FittedBox(child: Text("${productController.categoryProductList[index].name}",style: const TextStyle(fontSize: 12),maxLines: 1,)),
                          ],

                        );
                      }),
                ],
              );
          }
        ),
      ),
    );
  }
}
