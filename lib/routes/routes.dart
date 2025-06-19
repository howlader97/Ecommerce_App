import 'package:ecommerce_app/features/home/screens/dashboard_screen.dart';
import 'package:ecommerce_app/features/home/screens/splash_screen.dart';
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

    GetPage(
      name: RoutesName.dashboard,
      page: () => const DashboardScreen(),
    ),

    GetPage(
      name: RoutesName.splash,
      page: () => const SplashScreen(),
    ),


  ];
}
