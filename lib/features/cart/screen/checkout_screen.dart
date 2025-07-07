import 'package:ecommerce_app/common/widgets/custom_button.dart';
import 'package:ecommerce_app/common/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/auth/controller/auth_controller.dart';
import 'package:ecommerce_app/features/product/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  @override
  void initState() {
    // TODO: implement initState

    Get.find<AuthController>().getUserDetails();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar: AppBar(
          title: Text("Checkout"),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<ProductController>(
              builder: (productController) {
                return SingleChildScrollView(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      CustomTextField(
                        hintText: "Phone Number",
                        labelText: "Phone Number",
                        controller:productController.phoneController ,

                      ),
                      SizedBox(height: 16,),
                      CustomTextField(
                        hintText: "Address",
                        labelText: "Address",
                        controller:productController.addressController ,

                      ),
                      SizedBox(height: 16,),
                      CustomTextField(
                        hintText: "State",
                        labelText: "State",
                        controller:productController.stateController ,

                      ),
                      SizedBox(height: 16,),
                      CustomTextField(
                        hintText: "Zip Code",
                        labelText: "Zip Code",
                        controller:productController.zipController ,

                      ),
                      SizedBox(height: 16,),

                      Text("Choose Payment Method", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                      SizedBox(height: 16,),
                      DropdownButton(

                        onChanged: (value){
                          productController.setPaymentMethod(value.toString());
                        },
                        isExpanded: true,
                        value: productController.paymentMethod,
                        items: [
                          DropdownMenuItem(
                            value: "1",
                            child: Text("Bkash"),
                          ),
                          DropdownMenuItem(
                            value: "2",
                            child: Text("Rocket"),
                          ),
                          DropdownMenuItem(
                            value: "3",
                            child: Text("Nagad"),
                          ),
                        ],
                      ),

                      SizedBox(height: 16,),
                      CustomTextField(
                        hintText: "Payment Number",
                        labelText: "Payment Number",
                        controller:productController.paymentNumberController ,

                      ),
                      SizedBox(height: 16,),
                      CustomTextField(
                        hintText: "Transaction ID",
                        labelText: "Transaction ID",
                        controller:productController.paymentTransactionIdController ,

                      ),
                      SizedBox(height: 16,),
                      CustomButton(
                        buttonText: "Confirm Order",
                        onPressed: () {
                          if(productController.cartItems!.isEmpty) {
                            Get.snackbar("Error", "Your cart is empty", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
                          } else {
                            productController.placeOrder(

                            );
                          }
                        },
                      ),

                      SizedBox(height: 16,),



                    ],
                  ),
                );
              }
          ),
        )
    );
  }
}
