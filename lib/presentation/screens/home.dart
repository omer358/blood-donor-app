import 'package:blood_donor/presentation/screens/articles_screen.dart';
import 'package:blood_donor/presentation/screens/profile.dart';
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
        title: const Text('الصفحة الرئيسية'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
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
            ProfileScreen(),
            ArticlesScreen(),
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
              icon: Icon(Icons.notifications),
              label: 'الطلبات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'الملف الشخصي',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'معلومات',
            ),
          ],
        );
      }),
    );
  }
}
