import 'package:customer/controller/imrpove_process_controller.dart';
import 'package:get/get.dart';

class ImproveProcessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ImproveProcessController>(ImproveProcessController(),
        tag: 'global');
    Get.create<ImproveProcessController>(() => ImproveProcessController());
  }
}
