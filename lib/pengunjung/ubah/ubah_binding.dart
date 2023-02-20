import 'package:get/instance_manager.dart';
import '/pengunjung/ubah/ubah_controller.dart';

class UbahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UbahController>(
      () => UbahController(),
    );
  }
}
