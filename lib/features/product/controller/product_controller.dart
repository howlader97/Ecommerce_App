import 'package:ecommerce_app/common/widgets/custom_snackbar.dart';
import 'package:ecommerce_app/features/auth/controller/auth_controller.dart';
import 'package:ecommerce_app/features/cart/dbHelper/database_helper.dart';
import 'package:ecommerce_app/features/cart/model/cart_model.dart';
import 'package:ecommerce_app/features/home/screens/dashboard_screen.dart';
import 'package:ecommerce_app/features/product/model/category_product_model.dart';
import 'package:ecommerce_app/features/product/model/order_model.dart';
import 'package:ecommerce_app/features/product/model/product_model.dart';
import 'package:ecommerce_app/features/product/repository/product_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductController extends GetxController implements GetxService {
  final ProductRepository productRepository;

  ProductController({required this.productRepository});

  bool _isLoading = false;
  bool isLoadingMore = false;
  List<CategoryProductModel> _categoryProductList = [];
  List<CategoryProductModel> get categoryProductList => _categoryProductList;



  Future<void> getCategoryWiseProduct(String categoryId) async {
    _isLoading = true;
    _categoryProductList = [];
    update();

    Response response = await productRepository.getCategoryWiseProduct(
        categoryId);

    if (response.statusCode == 200) {
      // _categoryList = (response.body as List).map((category) => CategoryModel.fromJson(category)).toList();
      if(response.body["status"]!="success"){
        showCustomSnackBar("${response.body["msg"]}");
      }
      _isLoading = false;
      update();
      for (var i in response.body["products"]) {
        _categoryProductList.add(CategoryProductModel.fromJson(i));
      }

    } else {
      _isLoading = false;
      update();
    }
  }



  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;



  Future<void> getAllProducts() async {
    _isLoading = true;
    update();

    Response response = await productRepository.getAllProduct();

    if (response.statusCode == 200) {


      for (var i in response.body) {
        _productList.add(ProductModel.fromJson(i));

        _isLoading = false;
        update();
      }

    } else {
      _isLoading = false;
      update();
    }
  }


  List<CartItem> _cartItems = [];

  List<CartItem>? get cartItems => _cartItems;


  getAllCartItems() async {
    _cartItems = await DatabaseHelper().getCartItems();
    update();
  }


  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var item in _cartItems) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;

  }


  void increaseQuantity(CartItem item)async{
    item.quantity++;
    await DatabaseHelper().updateCartItem(item);
    getAllCartItems();
    getTotalPrice();
  }

  void decreaseQuantity(CartItem item) async {
    if (item.quantity > 1) {
      item.quantity--;
      await DatabaseHelper().updateCartItem(item);
      getAllCartItems();
      getTotalPrice();
    } else {
      showCustomSnackBar("Quantity cannot be less than 1", isError: true);
    }
  }



  TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;

  TextEditingController _addressController = TextEditingController();
  TextEditingController get addressController => _addressController;

  TextEditingController _stateController = TextEditingController();
  TextEditingController get stateController => _stateController;

  TextEditingController _zipController = TextEditingController();
  TextEditingController get zipController => _zipController;

  TextEditingController _paymentNumberController = TextEditingController();
  TextEditingController get paymentNumberController => _paymentNumberController;

  TextEditingController _paymentTransactionIdController = TextEditingController();
  TextEditingController get paymentTransactionIdController => _paymentTransactionIdController;




  String _paymentMethod = "1";
  String get paymentMethod => _paymentMethod;


  void setPaymentMethod(String value) {
    _paymentMethod = value;
    update();
  }

  void clearController() {
    _phoneController.clear();
    _addressController.clear();
    _stateController.clear();
    _zipController.clear();
    _paymentNumberController.clear();
    _paymentTransactionIdController.clear();
    _paymentMethod = "1"; // Reset to default payment method
    update();
  }





  Future<void> placeOrder()async{
    _isLoading=true;
    update();
    Response response =await productRepository.placeOrder(body:{
      "customer_id":Get.find<AuthController>().profileModel?.id.toString(),
      "user_type":Get.find<AuthController>().profileModel?.userType,
      "full_name":Get.find<AuthController>().profileModel?.name,
      "email":Get.find<AuthController>().profileModel?.email,
      "mobile_no":_phoneController.text.toString(),
      "address":_addressController.text.toString(),
      "cpn_disc_amt":"0",
      //"sell_date":"2022-01-08",
      "sell_date":DateFormat('yyyy-MM-dd').format(DateTime.now()),
      "delivery_charge":"60",
      "transact_charge_id":"1",
      "paid_amount":getTotalPrice().toStringAsFixed(0).toString(),
      "order_total":getTotalPrice().toStringAsFixed(0).toString(),
      "payment_method":paymentMethod,
      paymentMethod=="1"?"bkash_number":paymentMethod=="2"?"rocket_number":"nagad_number" :"${_paymentNumberController.text.toString()}",
      paymentMethod=="1"?"bkash_txn_id":paymentMethod=="2"?"rocket_txn_id":"nagad_txn_id" :"${paymentTransactionIdController.text.toString()}",
      paymentMethod=="1"?"bk_charge_amt":paymentMethod=="2"?"rkt_charge_amt":"rgd_charge_amt" :"0",
      "cart_items":cartItems!.map((e)=>{
        "id":e.id,
        "name":e.name,
        "price":e.price,
        "qty":e.quantity,
        "discount_amount":"0",
        "options":{
          "size":e.sizeId,
          "color":e.colorId,
        }
      }).toList()

    } );

    print("status code issssss${response.statusCode}");
    if(response.statusCode==200 || response.statusCode==201 ){
      showCustomSnackBar("Order Created Successfully",isError: false);
      await DatabaseHelper().deleteAllCartItems();
      clearController();
      Get.offAll(DashboardScreen());

    }else{
      showCustomSnackBar("failed, Pls Try Again");
      _isLoading=false;
      update();
    }
  }

  List<OrderDetailsModel> _orderDetailsList = [];
  List<OrderDetailsModel> get orderDetailsList => _orderDetailsList;


  Future<void> getOrderDetails() async {
    _isLoading = true;
    _orderDetailsList = [];
    update();

    Response response = await productRepository.getOrderDetails();

    if (response.statusCode == 200) {
      for (var i in response.body) {
        _orderDetailsList.add(OrderDetailsModel.fromJson(i));
      }
      _isLoading = false;
      update();

    } else {
      _isLoading = false;
      update();
    }
  }






}