import 'package:customer/controller/mspp_controller.dart';
import 'package:get/get.dart';

class MsppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MsppController>(MsppController());
  }
}
