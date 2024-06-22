import 'package:ecom_matrix/controller/catergories_product/categories_product_controller.dart';
import 'package:ecom_matrix/controller/home/home_controller.dart';
import 'package:ecom_matrix/controller/main/main_controller.dart';
import 'package:get/get.dart';

init() async {
  Get.lazyPut(() => MainController(), fenix: true);
  Get.lazyPut(() => HomeController(), fenix: true);
  Get.lazyPut(() => CategoriesProductController(), fenix: true);
}
