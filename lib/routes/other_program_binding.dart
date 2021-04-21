import 'package:customer/controller/other_program_controller.dart';
import 'package:get/get.dart';

class OtherProgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OtherProgramController>(OtherProgramController());
  }
}
