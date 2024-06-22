import 'package:ecom_matrix/view/home/home_page.dart';
import 'package:ecom_matrix/view/live_support/live_support_page.dart';
import 'package:ecom_matrix/widget/loder_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt selectedTab = 0.obs;
  RxList<BottomNavigationBarItem> navigationItemList = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          // color: primaryColor,
        ),
        label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined), label: "cart"),
    BottomNavigationBarItem(
        icon: Icon(Icons.support_agent), label: "Live Support"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
  ].obs;

  RxList screenList = [
    HomePage(),
    LoaderWidget.style1(child: Container(), isLoading: true),
    LiveSupportPage(),
    HomePage(),
  ].obs;
}
