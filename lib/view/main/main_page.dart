import 'package:ecom_matrix/controller/main/main_controller.dart';
import 'package:ecom_matrix/utils/constant_colors.dart';
import 'package:ecom_matrix/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              selectedItemColor: primaryColor,
              unselectedItemColor: Colors.black26,
              backgroundColor: grayBg,
              currentIndex: controller.selectedTab.value,
              onTap: (value) {
                controller.selectedTab.value = value;
              },
              items: controller.navigationItemList),
        ),
        body: Obx(
          () => controller.screenList[controller.selectedTab.value],
        ),
      );
    });
  }
}
