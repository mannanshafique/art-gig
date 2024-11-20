import 'package:get/get.dart';

class RoleController extends GetxController {
  //! Setting True For Testing
  static RoleController get i => Get.find();
  RxString selectedRole = 'user'.obs;

  void setRole({String? comingRole}) {
    selectedRole.value = comingRole ?? 'user';
  }
}
