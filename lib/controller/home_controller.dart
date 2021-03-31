import 'package:customer/controller/login_controller.dart';
import 'package:customer/widgets/home/home_admin.dart';
import 'package:customer/widgets/home/home_customer.dart';
import 'package:customer/widgets/home/home_internal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LoginController _loginController = Get.find();

  Widget userType() {
    String type = _loginController.usr.value.type;
    Widget data;
    switch (type) {
      case 'admin':
        //command here
        data = HomeAdmin();
        break;
      case 'internal':
        //command here
        data = HomeInternal();
        break;
      case 'customer':
        //command here
        data = HomeCustomer();
        break;
      default:
        //command unknown
        data = Container();
    }
    return data;
  }
}
