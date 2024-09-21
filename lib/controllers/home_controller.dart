import 'package:get/get.dart';

import '../screens/login.dart';
import '../service/auth_service.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  final AuthService _authService = AuthService();


  void onTabSelected(int index) {
    selectedIndex.value = index;
  }

  void signOut() {
    _authService.signOut();
    Get.offAll(() => LoginScreen());
  }
}
