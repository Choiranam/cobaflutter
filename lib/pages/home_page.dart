import 'package:cobaflutter/controllers/bottom_nav_controller.dart';
import 'package:cobaflutter/pages/menus/custom_bottom_navigation_bar.dart';
import 'package:cobaflutter/pages/menus/favorite.dart';
import 'package:cobaflutter/pages/menus/home.dart';
import 'package:cobaflutter/pages/menus/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController =
        Get.find<BottomNavController>();

    final List<Widget> menus = [Home(), Favorite(), Profile()];

    return Obx(() {
      return Scaffold(
        body: menus[bottomNavController.selectedIndex.value],
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: bottomNavController.selectedIndex.value,
          onTap: bottomNavController.changeIndexMenu,
        ),
      );
    });
  }
}
