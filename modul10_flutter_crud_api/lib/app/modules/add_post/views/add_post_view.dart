import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:modul10_flutter_crud_api/app/modules/add_post/controllers/add_post_controller.dart';
import 'package:modul10_flutter_crud_api/utils/app_color.dart';
import 'package:modul10_flutter_crud_api/widgets/custom_input.dart';

class AddPostView extends GetView<AddPostController> {
  const AddPostView({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Post',
          style: TextStyle(color: AppColor.secondary, fontSize: 14),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColor.secondaryExtraSoft,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        children: [
          CustomInput(
            controller: controller.titleC,
            label: 'Nama Post',
            hint: 'Berita Terkini',
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Kontent Post',
            hint: 'Ini contoh content post',
          ),
          SizedBox(height: 32),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Obx(
              () => ElevatedButton(
                onPressed: () {
                  if (controller.isLoading.isFalse) {
                    controller.addPost();
                  }
                },
                child: Text(
                  (controller.isLoading.isFalse) ? 'Tambah post' : 'Loading...',
                  style: TextStyle(fontSize: 16, fontFamily: 'poppins'),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  padding: EdgeInsets.symmetric(vertical: 18),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
