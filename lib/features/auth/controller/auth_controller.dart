import 'package:ecommerce_app/common/widgets/custom_snackbar.dart';
import 'package:ecommerce_app/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/features/auth/repository/auth_repository.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  bool _isLoading = false;

  bool get isLoading => _isLoading;


  TextEditingController _emailTEController = TextEditingController();

  TextEditingController get emailTEController => _emailTEController;

  TextEditingController _passwordTEController = TextEditingController();

  TextEditingController get passwordTEController => _passwordTEController;

  TextEditingController _nameTEController = TextEditingController();

  TextEditingController get nameTEController => _nameTEController;


  XFile ? _pickedImage;

  XFile? get pickedImage => _pickedImage;

  void setPickedImage(XFile image) {
    _pickedImage = image;
    update();
  }


  Future<void> pickImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      _pickedImage = XFile(pickedFile.path);
      update();
    }
  }


  chooseImageFrom() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return Container(
          height: 200,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () {
                  pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Gallery'),
                onTap: () {
                  pickImage(
                      ImageSource.gallery
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }


  Future<void> getRegister() async {
    _isLoading = true;
    update();
    Response response = await authRepository.getRegister({
      "name": _nameTEController.text.trim(),
      "email": _emailTEController.text.trim(),
      "password": _passwordTEController.text.trim(),
    }, _pickedImage);
    // print("Response Status Code: ${response.statusCode}");
    // print("${response.body}");

    if (response.statusCode == 200 && response.body['status'] == "success") {
      _isLoading = false;
      update();
      showCustomSnackBar("${response.body["msg"]}", isError: false);
      Get.offAllNamed(RoutesName.login);
    } else {
      _isLoading = false;
      update();
      showCustomSnackBar("${response.body["msg"]}", isError: true);
    }
  }


  Future<void> getLogin()async{
    _isLoading= true;
    update();
    Response response = await authRepository.getLogin({
      "email": _emailTEController.text.toString().trim(),
      "password": _passwordTEController.text.toString().trim(),
    });
    print("Response Status Code: ${response.statusCode}");
    print("${response.body}");

    if(response.statusCode == 200 ){
      _isLoading = false;
      update();
      showCustomSnackBar("${response.body["msg"]}", isError: false);

      Get.offAllNamed(RoutesName.dashboard);
    }else{
      _isLoading = false;
      update();
      showCustomSnackBar("${response.body["msg"]}", isError: true);
    }
  }

}
