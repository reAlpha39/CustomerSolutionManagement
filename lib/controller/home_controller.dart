import 'package:customer/controller/login_controller.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/widgets/home/home_admin.dart';
import 'package:customer/widgets/home/home_customer.dart';
import 'package:customer/widgets/home/home_internal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final DatabaseProvider _databaseProvider = DatabaseProvider();
  final LoginController _loginController = Get.find();

  RxString msppPage = ''.obs;
  Widget userView;
  String iconUser = '';

  RxString user = "".obs;
  RxList<String> listCustomer;
  RxString idCustomer = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    userType();
    _loadListCustomer();
    super.onInit();
  }

  void userType() {
    String type = _loginController.usr.value.type;
    switch (type) {
      case 'admin':
        //command here
        userView = HomeAdmin();
        msppPage.value = '/mspp_admin';
        iconUser = 'assets/images/icon_admin.png';
        break;
      case 'internal':
        //command here
        userView = HomeCustomer();
        iconUser = 'assets/images/icon_tc.png';
        break;
      case 'customer':
        //command here
        userView = HomeCustomer();
        msppPage.value = '/mspp';
        iconUser = 'assets/images/icon_customer.png';
        break;
      default:
        //command unknown
        userView = Container();
    }
  }

  _loadListCustomer() {
    try {
      isLoading.value = true;
      print(isLoading.value);
      _databaseProvider.listCustomer().then((value) {
        listCustomer = [''].obs;
        listCustomer.addAll(value);
        listCustomer.removeAt(0);
        isLoading.value = false;
        print(isLoading.value);
      });
    } catch (Exception) {}
  }
}
