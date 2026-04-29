import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;

  void togglePassword() => obscurePassword.value = !obscurePassword.value;
  void toggleConfirmPassword() =>
      obscureConfirmPassword.value = !obscureConfirmPassword.value;

  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void handleRegister(BuildContext context) {
    if (emailController.text.isEmpty ||
        usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Password tidak sesuai!',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    Get.snackbar(
      'Berhasil!',
      'Selamat datang, ${usernameController.text}!',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    Future.delayed(const Duration(milliseconds: 800), () {
      Get.offAllNamed(Routes.HOME);
    });
  }
}