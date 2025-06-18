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

TextEditingController _nameTEController=TextEditingController();
TextEditingController get nameTEController => _nameTEController;

TextEditingController _emailTEController=TextEditingController();
TextEditingController get emailTEController =>_emailTEController;

TextEditingController _passwordTEController=TextEditingController();
TextEditingController get passwordTEController => _passwordTEController;

XFile ? _pickedImage;
XFile? get pickedImage => _pickedImage;

void setPickedImage(XFile image){
  _pickedImage=image;
  update();
}

 Future<void>pickImage(ImageSource imageSource) async{
  final pickedFile=await ImagePicker().pickImage(source: imageSource);
  if(pickedFile != null){
    _pickedImage=XFile(pickedFile.path);
  }
}

chooseImageForm(){
  showModalBottomSheet(context: Get.context!,
      builder: (context){
    return Container(
      height: 200,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.camera),
            title: Text('Camera'),
            onTap: (){
              pickImage(ImageSource.camera);
              Navigator.of(context).pop();

            },
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Gallary'),
            onTap: (){
              pickImage(ImageSource.gallery);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
      });

}






}