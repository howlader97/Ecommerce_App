import 'package:ecommerce_app/common/widgets/carosel_slider.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HomeScreen extends StatelessWidget {
 HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: GetBuilder<HomeController>(
              builder: (homeController) {
                return Column(
                  children: [
                    homeController.sliderModel==null?const SizedBox(child: Text('nothing is here'),): ProductImageCarousel(
                      imageUrls: homeController.sliderModel!.sliders!.map((index) => index.image!)
                          .toList(),
                    ),
                  ],
                );
              }
          ),
        ),
      ),
    );
  }
}
