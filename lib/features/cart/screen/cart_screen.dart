import 'package:ecommerce_app/common/widgets/custom_snackbar.dart';
import 'package:ecommerce_app/features/cart/cart_controller.dart';
import 'package:ecommerce_app/features/cart/dbHelper/database_helper.dart';
import 'package:ecommerce_app/features/product/controller/product_controller.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    Get.find<ProductController>().getAllCartItems();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart",style: TextStyle(fontSize: 18,color: Colors.deepPurpleAccent),),
      ),
      body: Container(
        width: double.infinity,
        child: GetBuilder<ProductController>(
          builder: (productController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: productController.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = productController.cartItems[index];
                      return ListTile(
                        leading: Image.network(AppConstants.imageUrl + item.image),
                        title: Text(item.name),
                         subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price: \$${productController.cartItems[index].price} x ${productController.cartItems[index].quantity}"),
                          Row(
                            children: [
                              InkWell(
                                child: Icon(Icons.add, color: Colors.black,),
                                onTap: (){
                                  productController.increaseQuantity(productController.cartItems[index]);
                                },
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text("${productController.cartItems[index].quantity}"),
                              ),
                              InkWell(
                                child: Icon(Icons.remove, color: Colors.black,),
                                onTap: (){
                                   if(productController.cartItems[index].quantity > 1) {
                                     productController.decreaseQuantity(productController.cartItems[index]);
                                   } else {
                                     Get.snackbar("error","Quantity cannot be less than 1");
                                   }
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                        trailing: IconButton(
                          onPressed: () {
                            DatabaseHelper().deleteCartItem(item.id);
                            Get.find<ProductController>().getAllCartItems(); // Optional refresh
                          },
                          icon: Icon(Icons.delete),
                        ),


                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Total Price: \$${productController.getTotalPrice().toStringAsFixed(0)}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ],
            );
          },
        ),
      ),

    );
  }
}
