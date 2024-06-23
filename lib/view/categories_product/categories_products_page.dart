import 'package:ecom_matrix/controller/catergories_product/categories_product_controller.dart';
import 'package:ecom_matrix/utils/constant_colors.dart';
import 'package:ecom_matrix/utils/text_style.dart';
import 'package:ecom_matrix/utils/ui_const.dart';
import 'package:ecom_matrix/widget/custom_appbar.dart';
import 'package:ecom_matrix/widget/loder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class CategoriesProductsPage extends StatelessWidget {
  final String categoriesName;
  const CategoriesProductsPage({super.key, required this.categoriesName});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesProductController>(builder: (controller) {
      return Obx(() => Scaffold(
            primary: false,
            backgroundColor: grayBg,
            appBar: customAppBar(
                notificationPredicate: (notification) => false,
                appBarTitle: categoriesName,
                appBarBg: controller.isScrolled.value ? primaryColor : grayBg,
                context: context,
                leadingColor:
                    controller.isScrolled.value ? grayBg : Colors.black,
                textColor: controller.isScrolled.value ? grayBg : Colors.black),
            body: SafeArea(
                child: Column(
              children: [
                Container(
                  height: 50.sp,
                  padding: edgeInsetsOnly(0, 0, 2, 3),
                  alignment: Alignment.center,
                  width: double.infinity,
                  color: controller.isScrolled.value ? primaryColor : grayBg,
                  child: ListView.builder(
                    itemCount: controller.categoriesValueList.length,
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final catergoriesValue =
                          controller.categoriesValueList[index];
                      return Padding(
                        padding: index == 0
                            ? edgeInsetsOnly(4, 1, 0, 0)
                            : index != controller.categoriesValueList.length - 1
                                ? edgeInsetsSym(1, 0)
                                : edgeInsetsOnly(1, 4, 0, 0),
                        child: Obx(
                          () => InkWell(
                            onTap: () {
                              if (catergoriesValue ==
                                  controller.categoriesValue.value) {
                                controller.categoriesValue.value = '';
                              } else {
                                controller.categoriesValue.value =
                                    catergoriesValue;
                              }
                            },
                            child: Container(
                              padding: edgeInsetsSym(3, 0.5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: controller.categoriesValue.value ==
                                          catergoriesValue
                                      ? orrageColor
                                      : Colors.transparent,
                                  borderRadius: radiusAll(1.5),
                                  border: Border.all(
                                      width: controller.categoriesValue.value ==
                                              catergoriesValue
                                          ? 0
                                          : 1.sp,
                                      color: controller.isScrolled.value
                                          ? grayBg
                                          : Colors.black54)),
                              child: Text(
                                catergoriesValue,
                                style: controller.categoriesValue.value ==
                                        catergoriesValue
                                    ? AppTextStyle.tittleBig4(
                                        context: context, color: grayBg)
                                    : AppTextStyle.tittleSmall1(
                                        context: context,
                                        color: controller.isScrolled.value
                                            ? grayBg
                                            : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Column(
                    children: [
                      gapH(4),
                      Padding(
                        padding: screenPaddingH(),
                        child: Obx(
                          () => LoaderWidget.productLoad(
                            isLoading: controller.isLoading,
                            child: GridView.custom(
                              shrinkWrap: true,
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: SliverWovenGridDelegate.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 1.5.sp,
                                crossAxisSpacing: 1.5.sp,
                                pattern: const [
                                  WovenGridTile(0.8),
                                  WovenGridTile(
                                    5 / 8,
                                    crossAxisRatio: 0.9,
                                    alignment: AlignmentDirectional.centerEnd,
                                  ),
                                ],
                              ),
                              childrenDelegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  return Container(
                                      color: orrageColor,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "product ${index + 1}",
                                      ));
                                },
                                childCount: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            )),
          ));
    });
  }
}
