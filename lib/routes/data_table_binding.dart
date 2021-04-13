import 'package:customer/controller/data_table_controller.dart';
import 'package:get/get.dart';

class DataTableBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<DataTableController>(() => DataTableController());
  }
}
