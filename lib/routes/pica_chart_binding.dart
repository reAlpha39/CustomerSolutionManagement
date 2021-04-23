import 'package:customer/controller/pica_chart_controller.dart';
import 'package:get/get.dart';

class PicaGraphicBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PicaChartController>(PicaChartController());
  }
}