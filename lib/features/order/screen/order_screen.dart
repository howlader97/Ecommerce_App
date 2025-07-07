import 'package:ecommerce_app/features/product/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductController>().getOrderDetails();

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: Container(
          width: double.infinity,
          child: GetBuilder<ProductController>(
              builder: (productController) {
                return SingleChildScrollView(
                  child: Column(
                    children: [

                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: productController.orderDetailsList.length,
                          itemBuilder: (context,index){
                            ListTile(
                              title: Text("Order ID: ${productController.orderDetailsList[index].orderCode}"),
                            );
                          })
                    ],
                  ),
                );
              }
          )
      ),
    );
  }
}
