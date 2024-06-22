import 'package:ecom_matrix/utils/constant_colors.dart';
import 'package:ecom_matrix/utils/text_style.dart';
import 'package:ecom_matrix/utils/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePopulerProducts extends StatelessWidget {
  const HomePopulerProducts({super.key});

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
              "Popular Products",
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
            height: 800.sp,
            padding: edgeInsetsSym(2, 1),
            child: GridView.custom(
              // gridDelegate: SliverStairedGridDelegate(
              //   crossAxisSpacing: 7.sp,
              //   mainAxisSpacing: 5.sp,
              //   startCrossAxisDirectionReversed: true,
              //   pattern: [
              //     // const StairedGridTile(0.5, 1),
              //     // const StairedGridTile(0.5, 3 / 4),
              //     // const StairedGridTile(1.0, 10 / 4),
              //   ],
              // ),
              physics: const NeverScrollableScrollPhysics(),
              // semanticChildCount: 2,
              gridDelegate: SliverWovenGridDelegate.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1.5.sp,
                crossAxisSpacing: 1.5.sp,
                pattern: const [
                  WovenGridTile(0.8),
                  WovenGridTile(
                    5 / 8,
                    crossAxisRatio: 0.9,
                    alignment: AlignmentDirectional.center,
                  ),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                      color: orrageColor,
                      alignment: Alignment.center,
                      child: Text(
                        "${index + 1}",
                      ));
                },
                childCount: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
