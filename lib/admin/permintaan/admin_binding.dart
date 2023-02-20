import '/admin/permintaan/admin_controller.dart';
import 'admin_controller.dart';
import 'package:get/instance_manager.dart';

class PermintaanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminPermintaanController>(() => AdminPermintaanController());
  }
}
