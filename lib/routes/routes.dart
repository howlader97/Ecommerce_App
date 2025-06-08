import 'package:get/get.dart';
import 'package:ecommerce_app/features/auth/screens/login_screen.dart';
import 'package:ecommerce_app/features/auth/screens/register_screen.dart';
import 'package:ecommerce_app/routes/routes_name.dart';

class AppRoutes {
  static appRoutes() => [


    GetPage(
      name: RoutesName.login,
      page: () => const LoginScreen(),
    ),

    GetPage(
      name: RoutesName.register,
      page: () => const RegisterScreen(),
    ),


  ];
}
