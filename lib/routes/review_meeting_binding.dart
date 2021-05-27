import 'package:customer/controller/review_meeting_controller.dart';
import 'package:get/get.dart';

class ReviewMeetingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ReviewMeetingController>(ReviewMeetingController());
  }
}
