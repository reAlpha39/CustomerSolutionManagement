import 'package:customer/controller/customer_info_controller.dart';
import 'package:get/get.dart';

class CustomerInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerInfoController>(() => CustomerInfoController());
  }
}
