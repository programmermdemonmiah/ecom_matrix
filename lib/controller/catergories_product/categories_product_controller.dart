import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesProductController extends GetxController {
  @override
  void onInit() {
    //init state
    super.onInit();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.top]);
    categoriesName.value = Get.arguments['categoriesName'];
    getProducts();
    scrollController.addListener(() {
      if (scrollController.offset > 0 && !isScrolled.value) {
        isScrolled.value = true;
      } else if (scrollController.offset <= 0 && isScrolled.value) {
        isScrolled.value = false;
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.bottom]);

    ///  implement onClose
    super.onClose();
  }

  /////==========================
  RxString categoriesName = ''.obs;
  RxBool isScrolled = false.obs;
  final RxBool _isLoading = true.obs;
  set setLoading(bool value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;
  ScrollController scrollController = ScrollController();

  RxString categoriesValue = 'For you'.obs;

  RxList categoriesValueList = [
    "For you",
    "New",
    "Treading",
    "Recent",
    "Top",
  ].obs;

//===================

  getProducts() {
    setLoading = true;
    update();
    print("categoriesName: ${categoriesName.value}");
    // if (categoriesName.value != '') {
    //   String? data;
    //   for (int i = 0; i < 20; i++) {
    //     data = i.toString();
    //   }
    //   update();
    //   setLoading = false;
    //   print(categoriesName);
    // }
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setLoading = false;
      },
    );
    update();
  }
}
