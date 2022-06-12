import 'package:get/get.dart';
import '../helper/routes/route_name.dart';

class ControllController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeCurrentIndex(int index) async {
    currentIndex.value = index;

    switch (index) {
      case 0:
        Get.offAllNamed(Routes.homePage);
        break;
      case 1:
        Get.offAllNamed(Routes.favoritePage);
        break;
      case 2:
        Get.offAllNamed(Routes.settingPage);
        break;

      default:
        Get.offAllNamed(Routes.homePage);
    }
  }
}
