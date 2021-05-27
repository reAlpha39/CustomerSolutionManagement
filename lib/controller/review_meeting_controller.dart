import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ReviewMeetingController extends GetxController {
  PanelController? panelController;
  RxBool isUpdate = false.obs;

  @override
  void onInit() {
    panelController = PanelController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void resetPanel() {}

  void saveData() {}
}
