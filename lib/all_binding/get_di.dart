import 'package:ecom_matrix/controller/home/home_controller.dart';
import 'package:get/get.dart';

init() async {
  Get.lazyPut(() => HomeController(), fenix: true);
}
