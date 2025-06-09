import 'package:ecommerce_app/common/widgets/custom_snackbar.dart';
import 'package:ecommerce_app/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/features/auth/repository/auth_repository.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;
  AuthController({required this.authRepository});

   bool _isLoading=false;
  bool get isLoading => _isLoading;

   TextEditingController _emailTEController=TextEditingController();
  TextEditingController get emailTEController => _emailTEController;

   TextEditingController _passwordTEController =TextEditingController();
  TextEditingController get passwordTEController => _passwordTEController;

   TextEditingController _nameTEController=TextEditingController();
  TextEditingController get nameTEController => _nameTEController;


  XFile? _pickedImage;
  XFile? get pickedImage => _pickedImage;

  void setPickedImage(XFile image){
    _pickedImage = image;
    update();
  }

 Future<void> pickImage(ImageSource imageSource)async{
    final pickedFile= await ImagePicker().pickImage(source: imageSource);
    if(pickedFile != null){
      _pickedImage=XFile(pickedFile.path);
      update();
    }
  }

  chooseImageForm(){
    showModalBottomSheet(
        context: Get.context!,
        builder: (context){
          return SizedBox(
               height: 200,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text('camera'),
                  onTap: (){
                    pickImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo),
                  title: const Text('Gallery'),
                  onTap: (){
                    pickImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        }
    );
  }


  Future<void> getRegister() async{
    _isLoading=true;
    update();

    Response response = await authRepository.getRegister({
      "email": _emailTEController.text.trim(),
      "password": _passwordTEController.text,
      "name": _nameTEController.text.trim(),

    },_pickedImage!
    );

    if(response.statusCode ==200 && response.body['status'] =="success"){
      _isLoading=false;
      update();
      showCustomSnackBar("Register Successfully",isError: false);
      Get.offAllNamed(RoutesName.login);
    }else{
      _isLoading=true;
      update();
      showCustomSnackBar('Register failed',isError: true);
    }

  }


}