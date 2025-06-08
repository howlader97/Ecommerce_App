import 'package:get/get.dart';
import 'package:ecommerce_app/data/api/api_client.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepository({required this.apiClient, required this.sharedPreferences});

  Future<Response> login(Map<String, dynamic> data) async {
    return apiClient.postData(AppConstants.loginUri, data);
  }

  Future<Response> register(Map<String, dynamic> data) async {
    return apiClient.postData(AppConstants.loginUri, data);
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.token, token);
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }

  Future<void> removeToken() async {
    await sharedPreferences.remove(AppConstants.token);
    apiClient.token = '';
  }

}