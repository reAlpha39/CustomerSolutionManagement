import 'package:customer/views/login_page.dart';
import 'package:customer/views/home_page.dart';
import 'package:customer/views/customer_info.dart';
import 'package:customer/views/Mspp.dart';
import 'package:get/get.dart';

class Routes {
  static final route = [
    GetPage(name: '/login_page', page: () => LoginPage()),
    GetPage(name: '/home_page', page: () => HomePage()),
    GetPage(name: '/customer_info', page: () => CustomerInfo()),
    GetPage(name: '/mspp', page: () => Mspp()),
  ];
}
