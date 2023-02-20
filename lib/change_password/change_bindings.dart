import '../change_password/change_controller.dart';
import 'package:get/instance_manager.dart';

class ChangePasswordBindig extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(),
    );
  }
}
