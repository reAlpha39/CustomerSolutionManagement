import 'package:customer/controller/pica_analysis_controller.dart';
import 'package:get/get.dart';

class PicaAnalysisBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PicaAnalysisController>(PicaAnalysisController());
  }
}
