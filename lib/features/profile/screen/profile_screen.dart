import 'package:ecommerce_app/features/auth/controller/auth_controller.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<AuthController>(
            builder: (authController) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage("${AppConstants.imageUrl}${authController.profileModel?.image}" ?? ''),
                    ),
                    SizedBox(height: 16),
                    Text("Name: ${authController.profileModel?.name ?? 'N/A'}", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8),
                    Text("Email: ${authController.profileModel?.email ?? 'N/A'}", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8),
                    Text("Phone: ${authController.profileModel?.mobile ?? 'N/A'}", style: TextStyle(fontSize: 18)),
                  ],
                ),
              );
            },
          ),
        )
    );
  }
}
