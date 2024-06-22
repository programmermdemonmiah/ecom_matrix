import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesProductController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
    // TODO: implement onClose
    super.onClose();
  }

  /////==========================
  String? categoriesName;
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
    if (categoriesName != null) {
      String? data;
      for (int i = 0; i < 20; i++) {
        data = i.toString();
      }
      update();
      setLoading = false;
      print(categoriesName);
    }
    Future.delayed(
      Duration(seconds: 3),
      () {
        setLoading = false;
        print(isLoading);
      },
    );
    update();
  }
}
