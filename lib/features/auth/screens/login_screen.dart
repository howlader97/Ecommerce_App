import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce_app/common/widgets/custom_button.dart';
import 'package:ecommerce_app/common/widgets/default_app_bar_view.dart';
import 'package:ecommerce_app/features/auth/controller/auth_controller.dart';
import 'package:ecommerce_app/helper/validators.dart';
import 'package:ecommerce_app/routes/routes_name.dart';
import 'package:ecommerce_app/utils/dimensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

   // _emailController.text = 'ranarr.dev@gmail.com';
    //_passwordController.text = '1516';

    return Scaffold(

    );
  }
}
