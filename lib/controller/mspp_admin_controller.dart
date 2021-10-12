import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:get/get.dart';

class MsppAdminController extends GetxController {
  final DatabaseProvider databaseProvider = DatabaseProvider();
  final MsppController msppController = Get.find();

  RxList<String?> listCustomer = [''].obs;
  RxString idCustomer = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    loadListCustomer();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  loadListCustomer() {
    try {
      isLoading.value = true;
      print(isLoading.value);
      databaseProvider.listCustomer().then((value) {
        print(value);
        listCustomer.addAll(value);
        listCustomer.removeAt(0);
        isLoading.value = false;
        print(isLoading.value);
      });
    } catch (exception) {}
  }
}
