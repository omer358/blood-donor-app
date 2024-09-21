import 'dart:developer';

import 'package:blood_donor/screens/articles_screen.dart';
import 'package:blood_donor/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import 'notifications.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(getTitle());
        }),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              log("button logout clicked");
              homeController.signOut();
            },
          ),
        ],
      ),
      body: Obx(() {
        return IndexedStack(
          index: homeController.selectedIndex.value,
          children: [
            NotificationsScreen(),
            ArticlesScreen(),
            ProfileScreen(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: homeController.selectedIndex.value,
          onTap: (index) {
            homeController.onTabSelected(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.bloodtype_rounded),
              label: 'الطلبات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'معلومات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'الملف الشخصي',
            ),
          ],
        );
      }),
    );
  }

  String getTitle() {
    var index = homeController.selectedIndex.value;
    switch (index) {
      case 0:
        return "طلبات التبرع";
      case 1:
        return "معلومات عامة";
      case 2:
        return "الملف الشخصي";
      default:
        return "طلبات التبرع";
    }
  }
}
