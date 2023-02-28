import '../edit_pengaturan/edit_controller.dart';
import 'package:get/instance_manager.dart';

class EditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditController>(
      () => EditController(),
    );
  }
}