import 'package:customer/controller/customer_info_controller.dart';
import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/routes/routes.dart';
import 'package:customer/utils/custom_color.dart';
import 'package:customer/views/Mspp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginController loginController =
      Get.put<LoginController>(LoginController());
  final HomeController homeController =
      Get.put<HomeController>(HomeController());
  final CustomerInfoController customerInfoController =
      Get.put<CustomerInfoController>(CustomerInfoController());
  final Mspp mspp = Get.put<Mspp>(Mspp());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        getPages: Routes.route,
        initialRoute: '/login_page',
        theme: ThemeData(
            primarySwatch: createMaterialColor(Color(0xffffcd29)),
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: Colors.white),
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black87),
              color: Color(0xffffcd29),
              titleTextStyle: TextStyle(color: Colors.black87),
              brightness: Brightness.light,
            )));
  }
}
