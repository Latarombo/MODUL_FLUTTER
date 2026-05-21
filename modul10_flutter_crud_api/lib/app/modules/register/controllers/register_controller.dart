import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modul10_flutter_crud_api/app/data/user_model.dart';
import 'package:modul10_flutter_crud_api/app/routes/app_pages.dart';
import 'package:modul10_flutter_crud_api/services/auth_api.dart';

class RegisterController extends GetxController {
  UserModel? userModel;
  final box = GetStorage();
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  Future registration() async {
    update();
    userModel = await AuthApi().registerAPI(
      nameC.text,
      emailC.text,
      passC.text,
    );
    if (userModel!.status == 200) {
      await box.write("token", userModel!.accessToken);
      await box.write("name", userModel!.name);
      await box.write("email", userModel!.email);
      update();
      Get.offAndToNamed(Routes.HOME);
    } else if (userModel!.status == 404) {
      update();
    }
  }
}
