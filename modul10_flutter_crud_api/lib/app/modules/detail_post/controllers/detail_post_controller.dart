import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:modul10_flutter_crud_api/app/data/post_model.dart';
import 'package:modul10_flutter_crud_api/app/routes/app_pages.dart';
import 'package:modul10_flutter_crud_api/services/post_api.dart';
import 'package:modul10_flutter_crud_api/widgets/custom_alert_dialog.dart';

class DetailPostController extends GetxController {
  //TODO: Implement DetailPostController
  final Map<String, dynamic> argsData = Get.arguments;
  PostModel? postModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  TextEditingController titleC = TextEditingController();
  TextEditingController contentC = TextEditingController();
  @override
  onClose() {
    titleC.dispose();
    contentC.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    titleC.text = argsData["title"];
    contentC.text = argsData["content"];
  }

  Future<void> deletePost() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data todo",
      message: "Apakah anda ingin menghapus data todo ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back(); // close modal
        update();
        postModel = await PostApi().deletePostAPI(argsData["id"]);
        if (postModel!.status == 200) {
          update();
          Get.offAndToNamed(Routes.HOME);
        }
      },
    );
  }
}
