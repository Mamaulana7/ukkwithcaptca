import 'package:kantin/Profil/profil_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:get/instance_manager.dart';

class ProfilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilController>(
      () => ProfilController(),
    );
  }
}