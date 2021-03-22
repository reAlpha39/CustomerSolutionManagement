import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/routes/routes.dart';
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
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        getPages: Routes.route,
        initialRoute: '/login_page',
        theme: ThemeData(primarySwatch: Colors.yellow));
  }
}
