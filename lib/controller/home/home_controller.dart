import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    startAutoSlide();
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
    pageController.dispose();
    _autoSlideTimer.cancel();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    super.onClose();
  }

  ScrollController scrollController = ScrollController();
  var isScrolled = false.obs;
  PageController pageController = PageController();
  late Timer _autoSlideTimer;
  final RxInt slidePageIndex = 0.obs;
  late bool _isLoading = false;
  set setLoading(bool value) => _isLoading = value;
  bool get isLoading => _isLoading;

  void startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 8), (Timer timer) {
      if (slidePageIndex.value < 10) {
        slidePageIndex.value++;
      } else {
        slidePageIndex.value = 0;
      }
      pageController.animateToPage(
        slidePageIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }
}
