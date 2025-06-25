import 'package:ecommerce_app/features/product/model/product_model.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetailsScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 350,
              child: Image.network(
                "${AppConstants.imageUrl}"
                "${productModel.mainImage!}",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productModel.name!,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  Text("ProductId : ""${productModel.id.toString()}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.green),),
                  Text("BrandId : ""${productModel.brandId.toString()}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.green),),
                  Text("Category : ""${productModel.category}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.green),),
                  Text("Discount : ""${productModel.discount}""%",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.green),),
                  Row(children: [
                    Text("price : ""${productModel.sellPrice.toString()}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.green),),
                    const SizedBox(width: 20,),
                    Text("Quenty : ""${productModel.sellQty}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.greenAccent),),
                  ],),



                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
