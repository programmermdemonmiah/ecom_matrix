import 'package:ecom_matrix/controller/home/home_controller.dart';
import 'package:ecom_matrix/utils/constant_colors.dart';
import 'package:ecom_matrix/utils/ui_const.dart';
import 'package:ecom_matrix/widget/custom_textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HomeAppbar extends StatelessWidget {
  final HomeController controller;
  const HomeAppbar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 80.sp,
        child: AppBar(
          forceMaterialTransparency: !controller.isScrolled.value,
          automaticallyImplyLeading: false,
          toolbarHeight: 80.sp,
          primary: true,
          backgroundColor:
              controller.isScrolled.value ? primaryColor : Colors.transparent,
          title: Container(
            alignment: Alignment.center,
            height: 60.sp,
            padding: edgeInsetsSym(4, 2),
            child: CustomTextFormFild(
              padding: edgeInsetsOnly(0, 0, 0.5, 0.1),
              controller: TextEditingController(),
              inputType: TextInputType.text,
              hintText: "Search product",
              isFilled: true,
              isPrefixIcon: true,
              prefixIcon: Icons.search,
            ),
          ),
        ),
      ),
    );
  }
}
