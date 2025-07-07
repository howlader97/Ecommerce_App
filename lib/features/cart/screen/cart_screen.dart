
import 'package:ecommerce_app/common/widgets/custom_button.dart';
import 'package:ecommerce_app/common/widgets/custom_snackbar.dart';
import 'package:ecommerce_app/features/cart/dbHelper/database_helper.dart';
import 'package:ecommerce_app/features/cart/model/cart_model.dart';
import 'package:ecommerce_app/features/cart/screen/checkout_screen.dart';
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
  void initState()  {
    // TODO: implement initState
    print("startttt");
    Get.find<ProductController>().getAllCartItems();
    print("Enddd");
    super.initState();
  }







  @override
  Widget build(BuildContext context) {
    return   Scaffold(

        appBar: AppBar(
          title: Text("Cart"),
        ),
        body:Container(
          width: double.infinity,
          height: double.infinity,
          child: GetBuilder<ProductController>(
              builder: (productController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: productController.cartItems?.length,
                          itemBuilder: (context,index){
                            return ListTile(
                              leading: Image.network(AppConstants.imageUrl+productController.cartItems![index].image!),
                              title: Text(productController.cartItems![index].name!),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Price: \$${productController.cartItems![index].price} x ${productController.cartItems![index].quantity}"),
                                  Row(
                                    children: [
                                      InkWell(
                                        child: Icon(Icons.add, color: Colors.black,),
                                        onTap: (){
                                          productController.increaseQuantity(productController.cartItems![index]);
                                        },
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Text("${productController.cartItems![index].quantity}"),
                                      ),
                                      InkWell(
                                        child: Icon(Icons.remove, color: Colors.black,),
                                        onTap: (){
                                          if(productController.cartItems![index].quantity > 1) {
                                            productController.decreaseQuantity(productController.cartItems![index]);
                                          } else {
                                            showCustomSnackBar("Quantity cannot be less than 1", isError: true);
                                          }
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  DatabaseHelper().deleteCartItem(productController.cartItems![index].id!);
                                  productController.getAllCartItems();
                                },
                              ),

                            );}),
                    ),


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Total Price: \$${productController.getTotalPrice().toStringAsFixed(0)}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ),

                    SizedBox(height:  10,),

                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: CustomButton(buttonText: "Checkout",
                          onPressed: () {
                            if(productController.cartItems!.isEmpty) {
                              showCustomSnackBar("Your cart is empty", isError: true);
                            } else {
                              // Navigate to checkout screen or perform checkout action
                              Get.to(CheckoutScreen());
                              showCustomSnackBar("Proceeding to checkout", isError: false);
                            }
                          }
                      ),
                    )
                  ],
                );
              }
          ),
        )
    );
  }
}
