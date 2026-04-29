import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';
import '../../../../shared/widgets/app_input_field.dart';
import '../../../../shared/widgets/app_buttons.dart';
import '../../../../shared/widgets/social_login_button.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0, left: 0, right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.30,
              color: const Color(0xFFB85C52),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Daftar',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Isi data diri Anda untuk bergabung!',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 32),

                          InputField(
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            hint: 'Email',
                          ),
                          const SizedBox(height: 16),
                          InputField(
                            controller: controller.usernameController,
                            hint: 'Username',
                          ),
                          const SizedBox(height: 16),
                          Obx(() => InputField(
                            controller: controller.passwordController,
                            obscureText: controller.obscurePassword.value,
                            hint: 'Password',
                            toggleObscure: controller.togglePassword,
                          )),
                          const SizedBox(height: 8),
                          Obx(() => InputField(
                            controller: controller.confirmPasswordController,
                            obscureText:
                                controller.obscureConfirmPassword.value,
                            hint: 'Confirm Password',
                            toggleObscure: controller.toggleConfirmPassword,
                          )),
                          const SizedBox(height: 24),

                          PrimaryButton(
                            text: 'Daftar',
                            onPressed: () =>
                                controller.handleRegister(context),
                          ),
                          const SizedBox(height: 24),
                          SocialLoginButton(
                            text: 'Lanjut dengan Google',
                            iconPath: 'assets/images/icon_google.png',
                            onPressed: () {},
                          ),
                          const SizedBox(height: 16),
                          SocialLoginButton(
                            text: 'Lanjut dengan Facebook',
                            iconPath: 'assets/images/icon_facebook.png',
                            onPressed: () {},
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}