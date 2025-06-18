import 'dart:io';

import 'package:ecommerce_app/features/auth/controller/auth_controller.dart';
import 'package:ecommerce_app/features/auth/screens/login_screen.dart';
import 'package:ecommerce_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(480),
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.fontSizeExtraLarge,
        ),
        width: double.infinity,
        child: GetBuilder<AuthController>(
          builder: (authController) {
            return Form(
              key: _globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome To\n Registration',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: Dimensions.paddingSizeDefault),

                  InkWell(
                    onTap: (){
                      authController.chooseImageFrom();
                    },
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.grey[200],
                      backgroundImage:
                          authController.pickedImage != null
                              ? FileImage(File(authController.pickedImage!.path))
                              : null,
                      child: authController.pickedImage == null
                      ?IconButton(
                        onPressed: () {
                          authController.chooseImageFrom();
                        },
                        icon: Icon(Icons.camera_alt_outlined),
                      ): null,
                    ),
                  ),

                  const SizedBox(height: 7),
                  CustomTextField(
                    controller: authController.nameTEController,
                    prefixIcon: TablerIcons.user,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: Dimensions.paddingSizeDefault),
                  CustomTextField(
                    controller: authController.emailTEController,
                    prefixIcon: TablerIcons.mail,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: Dimensions.paddingSizeDefault),
                  CustomTextField(
                    controller: authController.passwordTEController,
                    prefixIcon: TablerIcons.lock,
                    isPassword: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: Dimensions.paddingSizeDefault),

                  authController.isLoading
                      ? CircularProgressIndicator()
                      : CustomButton(
                        buttonText: "Register",
                        onPressed: () {
                          if (_globalKey.currentState!.validate()) {
                            authController.getRegister();
                          }
                        },
                      ),

                  const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account!",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(LoginScreen());
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
