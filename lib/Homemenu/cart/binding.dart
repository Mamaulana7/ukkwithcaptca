import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../kasir/controller/controllerkasir.dart';

class BindingCart extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KasirController>(
      () => KasirController(),
    );
  }
}
