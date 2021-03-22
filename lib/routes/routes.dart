import 'package:customer/views/login_page.dart';
import 'package:customer/views/home_page.dart';
import 'package:customer/views/customer_info.dart';
import 'package:get/get.dart';

class Routes {
  static final route = [
    GetPage(name: '/login_page', page: () => LoginPage()),
    GetPage(name: '/main_page_customer', page: () => HomePage()),
    GetPage(name: '/customer_info', page: () => CustomerInfo()),
  ];
}
