import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sign_in_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../../shared/widgets/app_input_field.dart';
import '../../../../shared/widgets/app_buttons.dart';
import '../../../../shared/widgets/social_login_button.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background atas
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.30,
              color: const Color(0xFFB85C52),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom,
                ),
                child: Column(
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Get.toNamed(Routes.REGISTER),
                            child: const Text(
                              'Register',
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

                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),

                    // Form Card
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Masuk',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Silahkan masuk ke akunmu untuk melanjutkan!',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 32),

                            // Username
                            InputField(
                              controller: controller.usernameController,
                              hint: 'Username',
                            ),
                            const SizedBox(height: 16),

                            // Password
                            Obx(
                              () => InputField(
                                controller: controller.passwordController,
                                hint: 'Password',
                                obscureText: controller.obscurePassword.value,
                                toggleObscure: controller.togglePassword,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Lupa Password
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'lupa password?*',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Tombol Masuk
                            PrimaryButton(
                              text: 'Masuk',
                              onPressed: () => controller.handleSignIn(context),
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
                            const SizedBox(height: 45),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
