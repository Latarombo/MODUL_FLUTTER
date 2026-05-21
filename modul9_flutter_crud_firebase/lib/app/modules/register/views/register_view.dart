import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_color.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Pendaftaran"),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          /// HEADER
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            padding: EdgeInsets.only(left: 32),
            decoration: BoxDecoration(
              gradient: AppColor.primaryGradient,
              image: DecorationImage(
                image: AssetImage('assets/images/pattern-1-1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TODO App",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text("by Hummasoft", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          /// FORM
          Container(
            height: MediaQuery.of(context).size.height * 0.70,
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(20, 36, 20, 84),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 24),

                /// NAMA
                TextField(
                  controller: controller.nameC,
                  decoration: InputDecoration(
                    labelText: "Nama Lengkap",
                    hintText: "nama lengkap anda",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                /// EMAIL
                TextField(
                  controller: controller.emailC,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "email anda",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                /// PASSWORD
                Obx(
                  () => TextField(
                    controller: controller.passC,
                    obscureText: controller.obsecureText.value,
                    decoration: InputDecoration(
                      labelText: "Kata Sandi",
                      hintText: "*************",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: IconButton(
                        icon: controller.obsecureText.value
                            ? SvgPicture.asset('assets/icons/show.svg')
                            : SvgPicture.asset('assets/icons/hide.svg'),
                        onPressed: () {
                          controller.obsecureText.value =
                              !controller.obsecureText.value;
                        },
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 8),
                Text(
                  "Kata sandi minimal 6 karakter",
                  style: TextStyle(color: AppColor.secondarySoft),
                ),
                SizedBox(height: 24),

                /// BUTTON DAFTAR
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.isFalse
                          ? () async => await controller.registration()
                          : null,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        backgroundColor: AppColor.primary,
                      ),
                      child: Text(
                        controller.isLoading.isFalse ? 'Daftar' : 'Loading...',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
