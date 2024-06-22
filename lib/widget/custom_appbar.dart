import 'package:ecom_matrix/utils/constant_colors.dart';
import 'package:ecom_matrix/utils/text_style.dart';
import 'package:ecom_matrix/utils/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

PreferredSizeWidget customAppBar(
    {required String appBarTitle,
    required BuildContext context,
    // required String appBarSubTitle,
    Color? appBarBg,
    Color? leadingColor,
    bool isActionIcon = true,
    Color? textColor}) {
  return AppBar(
    backgroundColor: appBarBg ?? primaryColor,
    leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: leadingColor ?? Colors.white,
          size: 25.sp,
        )),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appBarTitle,
          style: AppTextStyle.tittleBig1(
              context: context, color: textColor ?? Colors.white),
        ),
        // Text(
        //   appBarSubTitle,
        //   style: AppTextStyle.text4(
        //       context: context, color: textColor ?? Colors.white),
        // ),
      ],
    ),
    actions: isActionIcon
        ? [
            Icon(
              Icons.shopping_cart_outlined,
              color: leadingColor ?? Colors.white,
              size: 25.sp,
            ),
            gapW(3),
          ]
        : [],
  );
}
