import '../../navbar/navbar_controller.dart';
import '/admin/permintaan/admin_controller.dart';
import 'admin_controller.dart';
import 'package:get/instance_manager.dart';

class PermintaanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminPermintaanController>(() => AdminPermintaanController());

    Get.lazyPut<NavbarController>(
      () => NavbarController(),
    );
  }
}
