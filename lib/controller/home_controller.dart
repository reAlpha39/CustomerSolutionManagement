import 'package:customer/controller/login_controller.dart';
import 'package:customer/widgets/home/home_admin.dart';
import 'package:customer/widgets/home/home_customer.dart';
import 'package:customer/widgets/home/home_internal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LoginController _loginController = Get.find();

  RxString msppPage = ''.obs;
  Widget userView;

  @override
  void onInit() {
    userType();
    super.onInit();
  }

  void userType() {
    String type = _loginController.usr.value.type;
    switch (type) {
      case 'admin':
        //command here
        userView = HomeAdmin();
        msppPage.value = '/mspp_admin';
        break;
      case 'internal':
        //command here
        userView = HomeInternal();
        break;
      case 'customer':
        //command here
        userView = HomeCustomer();
        msppPage.value = '/mspp';
        break;
      default:
        //command unknown
        userView = Container();
    }
  }
}
