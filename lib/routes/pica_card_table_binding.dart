import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:get/get.dart';

class PicaCardTableBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PicaCardTableController>(PicaCardTableController());
    Get.put<PicaCardTableController>(PicaCardTableController(),
        tag: 'planUnit');
    Get.put<PicaCardTableController>(PicaCardTableController(), tag: 'meet');
    Get.put<PicaCardTableController>(PicaCardTableController(), tag: 'asses');
  }
}
