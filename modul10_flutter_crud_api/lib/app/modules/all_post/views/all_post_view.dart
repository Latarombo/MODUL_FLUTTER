import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:modul10_flutter_crud_api/app/modules/all_post/controllers/all_post_controller.dart';
import 'package:modul10_flutter_crud_api/app/routes/app_pages.dart';
import 'package:modul10_flutter_crud_api/utils/app_color.dart';
import 'package:modul10_flutter_crud_api/widgets/auto_load.dart';
import 'package:modul10_flutter_crud_api/widgets/no_data.dart';

class AllPostView extends GetView<AllPostController> {
  const AllPostView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllPostController>(
      builder: (controller) => AutoLoad(
        onInit: () async {
          await controller.loadPost();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Semua Data Post',
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
          body: GetBuilder<AllPostController>(
            builder: (controller) => controller.posts!.status == 200
                ? ListView.separated(
                    itemCount: controller.posts!.items!.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      var postData = controller.posts!.items![index];
                      return InkWell(
                        onTap: () => {
                          Get.toNamed(
                            Routes.DETAIL_POST,
                            arguments: {
                              "id": "${postData.id}",
                              "title": "${postData.title}",
                              "content": "${postData.content}",
                            },
                          ),
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1,
                              color: AppColor.primaryExtraSoft,
                            ),
                          ),
                          padding: EdgeInsets.only(
                            left: 24,
                            top: 20,
                            right: 29,
                            bottom: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (postData.title == null)
                                        ? "-"
                                        : "${postData.title}",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "${postData.content}",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : NoData(),
          ),
        ),
      ),
    );
  }
}
