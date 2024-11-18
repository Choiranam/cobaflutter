import 'package:cobaflutter/controllers/favorite_controller.dart';
import 'package:cobaflutter/pages/home_page.dart';
import 'package:cobaflutter/pages/menus/favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/login_page.dart';
import 'views/register_page.dart';
import 'controllers/bottom_nav_controller.dart';

void main() {
  Get.put(BottomNavController()); 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Authentication',
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/home', page: () => HomePage()), 
        GetPage(name: '/favorites', page: () => Favorite()),
      ],
    );
  }
}