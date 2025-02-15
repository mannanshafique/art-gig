import 'package:artgig/Utils/app_strings.dart';
import 'package:get/get.dart';

class RoleController extends GetxController {
  //! Setting True For Testing
  static RoleController get i => Get.find();
  RxString selectedRole = 'User'.obs;

  void setRole({String? comingRole}) {
    selectedRole.value = comingRole ?? 'User';
  }

  static bool isArtist() {
    return RoleController.i.selectedRole.value == AppStrings.ARTIST
        ? true
        : false;
  }
}
