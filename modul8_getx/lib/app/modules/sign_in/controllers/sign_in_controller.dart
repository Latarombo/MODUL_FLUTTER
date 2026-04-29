import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SignInController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final obscurePassword = true.obs;

  void togglePassword() => obscurePassword.value = !obscurePassword.value;

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void handleSignIn(BuildContext context) {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Username dan password tidak boleh kosong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (usernameController.text.length < 3) {
      Get.snackbar(
        'Peringatan',
        'Username minimal 3 karakter',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }
    if (passwordController.text.length < 6) {
      Get.snackbar(
        'Peringatan',
        'Password minimal 6 karakter',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }
    Get.snackbar(
      'Selamat Datang!',
      'Halo ${usernameController.text}, siap menjelajah?',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    Future.delayed(const Duration(milliseconds: 800), () {
      Get.offAllNamed(Routes.HOME);
    });
  }
}
