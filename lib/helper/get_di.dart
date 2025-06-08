import 'package:ecommerce_app/data/api/api_client.dart';
import 'package:ecommerce_app/features/auth/controller/auth_controller.dart';
import 'package:ecommerce_app/features/auth/repository/auth_repository.dart';
import 'package:ecommerce_app/features/home/controller/home_controller.dart';
import 'package:ecommerce_app/features/home/repository/home_repository.dart';
 import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));

  // Repository
  Get.lazyPut(() => AuthRepository(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => HomeRepository(apiClient: Get.find(),));

  // Controller
  Get.lazyPut(() => AuthController(authRepository: Get.find()));
  Get.lazyPut(() => HomeController(homeRepository: Get.find()));

  // Retrieving localized data
  Map<String, Map<String, String>> languages = {};

  return languages;
}
