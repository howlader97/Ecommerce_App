import 'package:ecommerce_app/features/cart/screen/cart_screen.dart';
import 'package:ecommerce_app/features/home/screens/home_screen.dart';
import 'package:ecommerce_app/features/order/screen/order_screen.dart';
import 'package:ecommerce_app/features/profile/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex=0;
  List<Widget> _screens =  [
    HomeScreen(),
    OrderScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index){
          _selectedIndex=index;
          if(mounted){
            setState(() {});
          }
        },
        selectedItemColor: Colors.indigoAccent,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          elevation: 6,
          items:const [

        BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.account_tree_rounded),label: "Order"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_checkout),label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
      ]),
    );
  }
}
