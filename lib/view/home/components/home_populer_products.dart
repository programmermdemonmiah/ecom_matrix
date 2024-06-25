import 'package:ecom_matrix/controller/home/home_controller.dart';
import 'package:ecom_matrix/model/product/product_model.dart';
import 'package:ecom_matrix/utils/constant_colors.dart';
import 'package:ecom_matrix/utils/text_style.dart';
import 'package:ecom_matrix/utils/ui_const.dart';
import 'package:ecom_matrix/view/product_details/product_details_page.dart';
import 'package:ecom_matrix/widget/loder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePopulerProducts extends StatelessWidget {
  final HomeController controller;
  const HomePopulerProducts({super.key, required this.controller});

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
            trailing: InkWell(
              onTap: () {
                controller.navigateCategoriesProductPage(
                    categoriesName: "Popular Products");
              },
              child: Container(
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
          ),
          Obx(
            () => Container(
              height: 900.sp,
              padding: edgeInsetsSym(2, 1),
              child: LoaderWidget.productLoad(
                isLoading: controller.isLoading,
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
                      WovenGridTile(0.75),
                      WovenGridTile(
                        5 / 8,
                        crossAxisRatio: 0.95,
                        alignment: AlignmentDirectional.centerEnd,
                      ),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return InkWell(
                        onTap: () => Get.to(ProductDetailsPage(
                          product: ProductModel(
                              categoryId: 501,
                              categoryName: "shirt",
                              id: 1,
                              image:
                                  "https://4.imimg.com/data4/RU/VC/MY-11853389/men-s-jackets-500x500.jpg",
                              title: "t-shirt"),
                        )),
                        child: Container(
                          padding: edgeInsetsSym(1, 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                // alignment: Alignment.center,
                                // decoration: BoxDecoration(),
                                child: Container(
                                  height: 160.sp,
                                  // width: 100.sp,
                                  padding: edgeInsetsSym(1.4, 1.2),
                                  alignment: Alignment.topRight,
                                  decoration: BoxDecoration(
                                    borderRadius: radiusAll(3),
                                    // color: orrageColor,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          "https://4.imimg.com/data4/RU/VC/MY-11853389/men-s-jackets-500x500.jpg",
                                        ),
                                        fit: BoxFit.fill),
                                  ),
                                  child: Icon(
                                    Icons.shopping_cart,
                                    size: 22.sp,
                                    color: orrageColor,
                                  ),
                                ),
                              ),
                              Text(
                                "Products title ",
                                maxLines: 2,
                                style:
                                    AppTextStyle.tittleBig3(context: context),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "৳500",
                                    style: AppTextStyle.tittleBig4(
                                        context: context),
                                  ),
                                  Container(
                                    padding: edgeInsetsSym(3, 1),
                                    decoration: BoxDecoration(
                                        color: orrageColor,
                                        borderRadius: radiusAll(4)),
                                    child: Text(
                                      "Buy now",
                                      style: AppTextStyle.tittleBig4(
                                          context: context),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: 6,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
