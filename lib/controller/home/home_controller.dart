import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startAutoSlide();
    scrollController.addListener(() {
      if (scrollController.offset > 0 && !isScrolled.value) {
        isScrolled.value = true;
      } else if (scrollController.offset <= 0 && isScrolled.value) {
        isScrolled.value = false;
      }
      print(isScrolled);
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  ScrollController scrollController = ScrollController();
  var isScrolled = false.obs;
  PageController pageController = PageController();
  final RxInt slidePageIndex = 0.obs;

  void startAutoSlide() {
    Timer.periodic(const Duration(seconds: 8), (Timer timer) {
      if (slidePageIndex.value < 10) {
        slidePageIndex.value++;
      } else {
        slidePageIndex.value = 0;
      }
      pageController.animateToPage(
        slidePageIndex.value,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }
}
