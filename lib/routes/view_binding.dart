import 'package:customer/controller/customer_info_controller.dart';
import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/controller/mspp_controller.dart';
import 'package:get/get.dart';

class ViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<CustomerInfoController>(() => CustomerInfoController(),
        fenix: true);
    Get.lazyPut<MsppController>(() => MsppController(), fenix: true);
  }
}
