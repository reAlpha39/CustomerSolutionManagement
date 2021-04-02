import 'package:customer/controller/mspp_admin_controller.dart';
import 'package:get/get.dart';

class MsppAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MsppAdminController>(() => MsppAdminController());
  }
}
