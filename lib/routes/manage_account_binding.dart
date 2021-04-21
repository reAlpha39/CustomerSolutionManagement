import 'package:customer/controller/manage_account_controller.dart';
import 'package:get/get.dart';

class ManageAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ManageAccountController>(ManageAccountController());
  }
}