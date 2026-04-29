import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        Get.offAllNamed(Routes.HOME);
        break;
      case 1:
        Get.offAllNamed(Routes.LEADERBOARD);
        break;
      case 2:
        Get.offAllNamed(Routes.PROFILE);
        break;
    }
  }
}