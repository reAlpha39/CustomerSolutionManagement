import 'package:customer/controller/part_program_controller.dart';
import 'package:get/get.dart';

class PartProgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartProgramController>(() => PartProgramController());
  }
}
