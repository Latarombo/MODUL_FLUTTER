import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:modul10_flutter_crud_api/app/data/post_model.dart';
import 'package:modul10_flutter_crud_api/app/routes/app_pages.dart';
import 'package:modul10_flutter_crud_api/services/post_api.dart';

class EditPostController extends GetxController {
  //TODO: Implement EditPostController
  PostModel? postModel;
  final Map<String, dynamic> argsData = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreatePost = false.obs;
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

  Future<void> editPost() async {
    update();
    postModel = await PostApi().editPostAPI(
      titleC.text,
      contentC.text,
      argsData["id"],
    );
    if (postModel!.status == 200) {
      update();
      Get.offAndToNamed(Routes.HOME);
    } else if (postModel!.status == 404) {
      update();
    }
  }
}
