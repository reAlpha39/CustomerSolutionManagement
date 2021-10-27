import 'package:customer/routes/login_binding.dart';
import 'package:customer/routes/routes.dart';
import 'package:customer/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      initialBinding: LoginBinding(),
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xffffcd29)),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black87),
          color: Color(0xffffcd29),
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
    );
  }
}
