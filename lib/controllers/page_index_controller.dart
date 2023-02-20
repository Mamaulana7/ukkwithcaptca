import '../routes/app_pages.dart';
import 'package:get/get.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changePage(int index) async {
    pageIndex.value = index;
    switch (index) {
      case 1:
        Get.offAllNamed(Routes.RIWAYAT);
        break;
      case 2:
        Get.offAllNamed(Routes.ADMIN);
        break;
      case 3:
        Get.offAllNamed(Routes.PERMINTAAN);
        break;
      default:
        Get.offAllNamed(Routes.MENU);
        break;
    }
  }
}
