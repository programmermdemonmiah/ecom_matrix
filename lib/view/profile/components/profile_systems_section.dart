import 'package:ecom_matrix/utils/constant_colors.dart';
import 'package:ecom_matrix/utils/text_style.dart';
import 'package:ecom_matrix/utils/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSystemsSection extends StatelessWidget {
  const ProfileSystemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsetsSym(2, 0),
      child: Card(
        elevation: 10,
        shadowColor: Colors.black38,
        child: Container(
          padding: edgeInsetsSym(2, 4),
          decoration: BoxDecoration(
            color: whiteBg,
            borderRadius: radiusAll(2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: edgeInsetsLeft(2),
                child: Text(
                  "Systems",
                  style: AppTextStyle.tittleBig2(context: context),
                ),
              ),
              gapH(4),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSystemsItems(title: "Pendings Payments"),
                  CustomSystemsItems(title: "Delivered"),
                  CustomSystemsItems(title: "Processing"),
                ],
              ),
              gapH(2),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSystemsItems(title: "Cancelled"),
                  CustomSystemsItems(title: "Terms & Conditions"),
                  CustomSystemsItems(title: "About Us"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSystemsItems extends StatelessWidget {
  final String title;
  const CustomSystemsItems({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.sp,
      width: 125.sp,
      color: whiteBg,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: ,
        children: [
          Icon(
            Icons.payment,
            size: 30.sp,
            color: Colors.black54,
          ),
          // gapH(1),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.tittleSmall1(
                context: context, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
