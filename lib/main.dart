import 'package:ecom_matrix/all_binding/get_di.dart';
import 'package:ecom_matrix/utils/constant_colors.dart';
import 'package:ecom_matrix/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (_, __) {
        return GetMaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: whiteBg,
            appBarTheme: AppBarTheme(
              backgroundColor: primaryColor,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: primaryColor,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.dark,
              ),
            ),
          ),
          title: "Ecom Matrix",
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
