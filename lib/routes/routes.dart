import 'package:customer/views/login_page.dart';
import 'package:customer/views/main_page_customer.dart';
import 'package:customer/views/customer_info.dart';
import 'package:get/get.dart';

class Routes {
  static final route = [
    GetPage(name: '/login_page', page: () => LoginPage()),
    GetPage(name: '/main_page_customer', page: () => MainPageCustomer()),
    GetPage(name: '/customer_info', page: () => CustomerInfo()),
  ];
}
