import 'package:ecom_matrix/controller/home/home_controller.dart';
import 'package:ecom_matrix/utils/constant_colors.dart';
import 'package:ecom_matrix/utils/ui_const.dart';
import 'package:ecom_matrix/view/home/components/home_appbar.dart';
import 'package:ecom_matrix/view/home/components/home_categories.dart';
import 'package:ecom_matrix/view/home/components/home_populer_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (HomeController controller) {
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
                  Obx(
                    () => Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          height: 300.sp,
                          child: PageView.builder(
                            itemCount: controller.pageSliderList.length,
                            controller: controller.pageController,
                            onPageChanged: (value) {
                              controller.slidePageIndex.value = value;
                            },
                            itemBuilder: (context, i) {
                              final data = controller.pageSliderList[i];
                              return Container(
                                height: 300.sp,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(data["image"]),
                                        fit: BoxFit.cover)),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 10.sp,
                          child: Row(
                            children: [
                              for (int i = 0;
                                  i < controller.pageSliderList.length;
                                  i++)
                                Padding(
                                  padding: edgeInsetsSym(0.3, 0),
                                  child: Container(
                                    height: controller.slidePageIndex.value == i
                                        ? 10.sp
                                        : 8.sp,
                                    width: controller.slidePageIndex.value == i
                                        ? 10.sp
                                        : 8.sp,
                                    // constraints: BoxConstraints.,
                                    decoration: BoxDecoration(
                                        color:
                                            controller.slidePageIndex.value == i
                                                ? grayBg
                                                : whiteBg,
                                        shape: BoxShape.circle),
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  gapH(5),
                  Padding(
                    padding: screenPaddingH(),
                    child: Column(
                      children: [
                        HomeCategories(controller: controller),
                        gapH(5),
                        HomePopulerProducts(controller: controller),
                        gapH(4),
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
