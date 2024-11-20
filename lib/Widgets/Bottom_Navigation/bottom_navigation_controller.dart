import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  static BottomNavigationController get i => Get.find();
  RxInt selectedIndex = 0.obs;

  void onItemTap(comingIndex) {
    selectedIndex.value = comingIndex;
  }
}
