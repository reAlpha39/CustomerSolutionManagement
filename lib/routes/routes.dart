import 'package:customer/routes/customer_info_binding.dart';
import 'package:customer/routes/home_binding.dart';
import 'package:customer/routes/login_binding.dart';
import 'package:customer/routes/mspp_binding.dart';
import 'package:customer/views/login_page.dart';
import 'package:customer/views/home_page.dart';
import 'package:customer/views/customer_info.dart';
import 'package:customer/views/Mspp.dart';
import 'package:get/get.dart';

class Routes {
  static final route = [
    GetPage(
      name: '/login_page',
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/home_page',
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/customer_info',
      page: () => CustomerInfo(),
      binding: CustomerInfoBinding(),
    ),
    GetPage(
      name: '/mspp',
      page: () => Mspp(),
      binding: MsppBinding(),
    ),
  ];
}
