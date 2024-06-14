import 'package:ecom_matrix/view/home/home_page.dart';
import 'package:ecom_matrix/view/message/message_page.dart';
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
    BottomNavigationBarItem(icon: Icon(Icons.message), label: "message"),
    BottomNavigationBarItem(icon: Icon(Icons.shop_sharp), label: "cart"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
  ].obs;

  RxList screenList = [
    HomePage(),
    MessagePage(),
    LoaderWidget(child: Container(), isLoading: true),
    HomePage(),
  ].obs;
}
