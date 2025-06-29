import 'package:ecommerce_app/features/cart/dbHelper/database_helper.dart';
import 'package:ecommerce_app/features/cart/model/cart_model.dart';
import 'package:ecommerce_app/features/product/repository/product_repository.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartController extends GetxController implements GetxService {
  final ProductRepository productRepository;

  CartController({required this.productRepository});







}