import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:modul10_flutter_crud_api/app/modules/detail_post/controllers/detail_post_controller.dart';
import 'package:modul10_flutter_crud_api/app/routes/app_pages.dart';
import 'package:modul10_flutter_crud_api/utils/app_color.dart';
import 'package:modul10_flutter_crud_api/widgets/custom_input.dart';

class DetailPostView extends GetView<DetailPostController> {
  const DetailPostView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Todo',
          style: TextStyle(color: AppColor.secondary, fontSize: 14),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.EDIT_POST, arguments: controller.argsData);
            },
            child: Text('Edit'),
            style: TextButton.styleFrom(backgroundColor: AppColor.primary),
          ),
        ],
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
            disabled: true,
          ),
          CustomInput(
            controller: controller.contentC,
            label: 'Kontent Post',
            hint: 'Ini contoh content post',
            disabled: true,
          ),
          ElevatedButton(
            onPressed: () {
              controller.deletePost();
            },
            child: Text(
              'Delete post',
              style: TextStyle(fontSize: 16, fontFamily: 'poppins'),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.warning,
              padding: EdgeInsets.symmetric(vertical: 18),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
