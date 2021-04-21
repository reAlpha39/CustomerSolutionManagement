import 'package:customer/controller/other_program_admin_controller.dart';
import 'package:get/get.dart';

class OtherProgramAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OtherProgramAdminController>(OtherProgramAdminController());
  }
}
