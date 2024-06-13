import 'package:ecom_matrix/utils/constant_colors.dart';
import 'package:ecom_matrix/view/home/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.black26,
          backgroundColor: grayBg,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  // color: primaryColor,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "message"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shop_sharp), label: "cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
          ]),
      body: HomePage(),
    );
  }
}
