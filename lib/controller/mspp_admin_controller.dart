import 'package:customer/repositories/database_provider.dart';
import 'package:get/get.dart';

class MsppAdminController extends GetxController {
  final DatabaseProvider databaseProvider = DatabaseProvider();

  RxList<String> listCustomer = [""].obs;

  @override
  void onInit() {
    
    super.onInit();
  }
}
