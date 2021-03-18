import 'package:customer/controller/login_controller.dart';
import 'package:customer/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  LoginController loginController = Get.put<LoginController>(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        getPages: Routes.route,
        initialRoute: '/login_page',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}
