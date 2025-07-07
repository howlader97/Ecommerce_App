import 'package:get/get.dart';
import 'package:ecommerce_app/data/api/api_client.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepository({required this.apiClient, required this.sharedPreferences});




  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString("token", token);
  }

 bool isLoggedIn(){
   return sharedPreferences.containsKey("token");
 }

  Future<void> removeToken() async {
    await sharedPreferences.remove(AppConstants.token);
    apiClient.token = '';
  }



  Future<Response> getRegister(Map<String,String> body, XFile? image)async {
    return await apiClient.postMultipartData(AppConstants.registerUri, body, [
      MultipartBody('image', image)
    ]);
  }

  Future<Response> getLogin(Map<String,String> body)async{
    return await apiClient.postData(AppConstants.loginUri, body);
  }

  Future<Response> getProfileDetails()async{
    return await apiClient.getData(AppConstants.profileDetailsUri );
  }


}