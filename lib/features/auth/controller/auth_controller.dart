import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/features/auth/repository/auth_repository.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;
  AuthController({required this.authRepository});

  final bool _isLoading=false;
  bool get isLoading => _isLoading;

  final TextEditingController _emailTEController=TextEditingController();
  TextEditingController get emailTEController => _emailTEController;

  final TextEditingController _passwordTEController =TextEditingController();
  TextEditingController get passwordTEController => _passwordTEController;

  final TextEditingController _nameTEController=TextEditingController();
  TextEditingController get nameTEController => _nameTEController;


  File? _pickedImage;
  File? get pickedImage => _pickedImage;

  void setPickedImage(File image){
    _pickedImage = image;
    update();
  }

 Future<void> pickImage(ImageSource imageSource)async{
    final pickedFile= await ImagePicker().pickImage(source: imageSource);
    if(pickedFile != null){
      _pickedImage=File(pickedFile.path);
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

}