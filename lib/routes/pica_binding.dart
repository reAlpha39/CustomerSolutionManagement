import 'package:customer/controller/pica_controller.dart';
import 'package:get/get.dart';

class PicaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PicaController>(() => PicaController());
  }
}
