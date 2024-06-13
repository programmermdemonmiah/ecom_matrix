import 'package:ecom_matrix/utils/constant_colors.dart';
import 'package:ecom_matrix/utils/text_style.dart';
import 'package:ecom_matrix/utils/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteBg,
        borderRadius: radiusAll(2),
      ),
      child: Column(
        children: [
          ListTile(
            minVerticalPadding: 0,
            contentPadding: edgeInsetsSym(2, 0),
            title: Text(
              "Categories",
              style: AppTextStyle.tittleBig3(context: context),
            ),
            subtitle: Text(
              "Recommended For you",
              style: AppTextStyle.paragraph2(context: context),
            ),
            trailing: Container(
              padding: edgeInsetsSym(2, 1),
              decoration: BoxDecoration(
                  borderRadius: radiusAll(1),
                  border: Border.all(width: 1.2.sp, color: orrageColor)),
              child: Text(
                "see more",
                style: AppTextStyle.paragraph3(
                    context: context, color: orrageColor),
              ),
            ),
          ),
          Container(
            height: 250.sp,
            padding: edgeInsetsSym(2, 1),
            child: GridView.builder(
              itemCount: 8,
              shrinkWrap: true,
              primary: false,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 2.sp,
                crossAxisSpacing: 2.sp,
                // mainAxisExtent: 1 / 1,
                childAspectRatio: 4 / 5,
              ),
              itemBuilder: (context, index) {
                return Container(
                  height: 100.sp,
                  width: 100.sp,
                  color: orrageColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
