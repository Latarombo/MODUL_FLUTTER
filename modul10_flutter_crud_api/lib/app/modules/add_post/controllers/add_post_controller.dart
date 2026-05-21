import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:modul10_flutter_crud_api/app/data/post_model.dart';
import 'package:modul10_flutter_crud_api/app/routes/app_pages.dart';
import 'package:modul10_flutter_crud_api/services/post_api.dart';

class AddPostController extends GetxController {
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

  Future addPost() async {
    update();
    postModel = await PostApi().addPostAPI(titleC.text, contentC.text);
    if (postModel!.status == 200) {
      update();
      Get.offAndToNamed(Routes.HOME);
    } else if (postModel!.status == 404) {
      update();
    }
  }
}
