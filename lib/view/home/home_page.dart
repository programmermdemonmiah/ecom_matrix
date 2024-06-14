import 'package:ecom_matrix/controller/home/home_controller.dart';
import 'package:ecom_matrix/utils/constant_colors.dart';
import 'package:ecom_matrix/utils/ui_const.dart';
import 'package:ecom_matrix/view/home/components/home_appbar.dart';
import 'package:ecom_matrix/view/home/components/home_categories.dart';
import 'package:ecom_matrix/widget/custom_textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      //     overlays: [SystemUiOverlay.bottom]);
      return Scaffold(
        backgroundColor: grayBg,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  Container(
                    height: 300.sp,
                    child: PageView.builder(
                      itemCount: 11,
                      controller: controller.pageController,
                      itemBuilder: (context, i) {
                        return Container(
                          height: 300.sp,
                          width: Get.width,
                          color: i == 0 ||
                                  i == 2 ||
                                  i == 4 ||
                                  i == 6 ||
                                  i == 8 ||
                                  i == 10
                              ? Colors.red
                              : Colors.pink,
                        );
                      },
                    ),
                  ),
                  gapH(5),
                  Padding(
                    padding: screenPaddingH(),
                    child: Column(
                      children: [
                        HomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            HomeAppbar(controller: controller),
          ],
        ),
      );
    });
  }
}
