import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modul10_flutter_crud_api/app/data/post_model.dart';
import 'package:modul10_flutter_crud_api/app/routes/app_pages.dart';
import 'package:modul10_flutter_crud_api/services/post_api.dart';
import 'package:modul10_flutter_crud_api/widgets/custom_alert_dialog.dart';
import 'package:modul10_flutter_crud_api/widgets/loading.dart';

class HomeController extends GetxController {
  PostListModel? posts;
  final box = GetStorage();
  bool homeScreen = false;
  loadPost() async {
    homeScreen = false;
    update();
    showLoading();
    posts = await PostApi().loadPostAPI();
    update();
    stopLoading();
    if (posts?.status == 200) {
    } else if (posts!.status == 204) {
      print("Empty");
    } else if (posts!.status == 404) {
      homeScreen = true;
      update();
    } else if (posts!.status == 401) {
    } else {
      print("someting wrong 400");
    }
  }

  logout() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Logout System",
      message: "Apakah anda yakin akan logout dari sistem ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back(); // close modal
        Get.back(); // back page
        try {
          box.remove("token");
          box.remove("name");
          box.remove("email");
          update();
          await Get.offAllNamed(Routes.LOGIN);
        } catch (e) {}
      },
    );
  }
}
