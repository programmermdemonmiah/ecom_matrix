import 'package:ecom_matrix/controller/cart/cart_controller.dart';
import 'package:ecom_matrix/controller/main/main_controller.dart';
import 'package:ecom_matrix/utils/constant_colors.dart';
import 'package:ecom_matrix/utils/text_style.dart';
import 'package:ecom_matrix/utils/ui_const.dart';
import 'package:ecom_matrix/widget/custom_appbar.dart';
import 'package:ecom_matrix/widget/custom_button.dart';
import 'package:ecom_matrix/widget/loder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () async {
          if (controller.isLongPressed.value) {
            controller.isLongPressed.value = false;
            controller.selecteIndexList.clear();
          } else {
            Get.find<MainController>().selectedTab.value = 0;
          }
          return false;
        },
        child: Obx(
          () => Stack(
            children: [
              Scaffold(
                backgroundColor: grayBg,
                appBar: customAppBar(
                    appBarTitle: "My Cart",
                    context: context,
                    leadingOnTap: () {
                      if (controller.isLongPressed.value) {
                        controller.isLongPressed.value = false;
                        controller.selecteIndexList.clear();
                      } else {
                        Get.find<MainController>().selectedTab.value = 0;
                      }
                    },
                    isActionIcon: true,
                    actions: [
                      controller.selecteIndexList.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                controller.removeCartProduct();
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 22.sp,
                                color: grayBg,
                              ))
                          : const SizedBox.shrink(),
                    ]),
                body: SafeArea(
                  child: Obx(
                    () => LoaderWidget.cartProductLoad(
                      isLoading: controller.isLoading,
                      child: Padding(
                        padding: controller.isLongPressed.value
                            ? edgeInsetsSym(6, 0)
                            : screenPaddingH(),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              gapH(4),
                              ListView.builder(
                                itemCount: controller.cartProductsList.length,
                                shrinkWrap: true,
                                primary: false,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final productsData =
                                      controller.cartProductsList[index];

                                  final price = productsData.quantity *
                                      productsData.price;

                                  return Padding(
                                    padding: edgeInsetsSym(0, 1),
                                    child: Obx(
                                      () => InkWell(
                                        splashColor: grayBg,
                                        onTap: () {
                                          if (controller.isLongPressed.value) {
                                            if (controller.selecteIndexList
                                                .contains(index)) {
                                              controller.selecteIndexList
                                                  .remove(index);
                                            } else {
                                              controller.selecteIndexList
                                                  .add(index);
                                            }
                                          } else {
                                            //go to another page
                                          }
                                        },
                                        onLongPress: () {
                                          controller.isLongPressed.value = true;
                                          controller.selecteIndexList
                                              .add(index);
                                        },
                                        child: Container(
                                          //  width: 100.sp,
                                          height: 140.sp,
                                          padding: edgeInsetsSym(2, 2),
                                          decoration: BoxDecoration(
                                            color: whiteBg,
                                            borderRadius: radiusAll(2),
                                          ),
                                          child: Row(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  width: 100.sp,
                                                  height: 135.sp,
                                                  padding: edgeInsetsAll(2),
                                                  decoration: BoxDecoration(
                                                    borderRadius: radiusAll(4),
                                                    color: grayBg,
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          "https://4.imimg.com/data4/RU/VC/MY-11853389/men-s-jackets-500x500.jpg",
                                                        ),
                                                        fit: BoxFit.cover),
                                                  ),
                                                  // child: Image.network(
                                                  //   "https://4.imimg.com/data4/RU/VC/MY-11853389/men-s-jackets-500x500.jpg",
                                                  //   fit: BoxFit.cover,
                                                  // ),
                                                ),
                                              ),
                                              gapW(1.5),
                                              Expanded(
                                                flex: 7,
                                                child: Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            productsData.title,
                                                            style: AppTextStyle
                                                                .tittleBig4(
                                                                    context:
                                                                        context),
                                                          ),
                                                          controller
                                                                  .isLongPressed
                                                                  .value
                                                              ? controller
                                                                      .selecteIndexList
                                                                      .contains(
                                                                          index)
                                                                  ? Container(
                                                                      padding:
                                                                          edgeInsetsAll(
                                                                              0.7),
                                                                      decoration: const BoxDecoration(
                                                                          color: Colors
                                                                              .green,
                                                                          shape:
                                                                              BoxShape.circle),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .check,
                                                                        color:
                                                                            grayBg,
                                                                        size: 16
                                                                            .sp,
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      padding:
                                                                          edgeInsetsAll(
                                                                              2.5),
                                                                      decoration: BoxDecoration(
                                                                          color:
                                                                              grayBg,
                                                                          shape:
                                                                              BoxShape.circle),
                                                                    )
                                                              : const SizedBox
                                                                  .shrink(),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "size:",
                                                            style: AppTextStyle
                                                                .paragraph3(
                                                                    context:
                                                                        context),
                                                          ),
                                                          gapW(2),
                                                          Text(
                                                            productsData.size,
                                                            style: AppTextStyle
                                                                .tittleBig4(
                                                                    context:
                                                                        context),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "color:",
                                                            style: AppTextStyle
                                                                .paragraph3(
                                                                    context:
                                                                        context),
                                                          ),
                                                          gapW(2),
                                                          Text(
                                                            productsData.color,
                                                            style: AppTextStyle
                                                                .tittleBig4(
                                                                    context:
                                                                        context),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                splashColor:
                                                                    whiteBg,
                                                                onTap: () {
                                                                  controller
                                                                      .decrementQuantity(
                                                                          index);
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      edgeInsetsAll(
                                                                          1),
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          grayBg,
                                                                      shape: BoxShape
                                                                          .circle),
                                                                  child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      size: 20
                                                                          .sp),
                                                                ),
                                                              ),
                                                              gapW(2),
                                                              Text(
                                                                productsData
                                                                    .quantity
                                                                    .toString(),
                                                                style: AppTextStyle
                                                                    .tittleBig4(
                                                                        context:
                                                                            context),
                                                              ),
                                                              gapW(2),
                                                              InkWell(
                                                                splashColor:
                                                                    whiteBg,
                                                                onTap: () {
                                                                  controller
                                                                      .incrementQuantity(
                                                                          index);
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      edgeInsetsAll(
                                                                          1),
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          grayBg,
                                                                      shape: BoxShape
                                                                          .circle),
                                                                  child: Icon(
                                                                      Icons.add,
                                                                      size: 20
                                                                          .sp),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "Total price:",
                                                                style: AppTextStyle
                                                                    .paragraph3(
                                                                        context:
                                                                            context),
                                                              ),
                                                              gapW(2),
                                                              Text(
                                                                "৳${price.toStringAsFixed(price.truncateToDouble() == price ? 0 : 0)}",
                                                                style: AppTextStyle
                                                                    .tittleBig4(
                                                                        context:
                                                                            context),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              gapH(controller.selecteIndexList.isNotEmpty
                                  ? 15
                                  : 4),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (controller.selecteIndexList.isNotEmpty)
                Positioned(
                  bottom: 15.sp,
                  left: 0,
                  right: 0,
                  child: Container(
                    // height: 50.sp,
                    padding: screenPaddingH(),
                    child: customButton(
                        buttonName: "Purchase products", context: context),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
