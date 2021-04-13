import 'package:customer/models/audit_table_data.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:get/get.dart';

class DataTableController extends GetxController {
  final DatabaseProvider _databaseProvider = DatabaseProvider();

  Rx<AuditTableData> auditTableData = AuditTableData().obs;
  RxBool isLoading = false.obs;

  loadDataTable({String docA, String colA, String docB}) {
    isLoading.value = true;
    connectivityChecker().then((conn) {
      if (conn) {
        _databaseProvider
            .auditDataTable(docA: docA, collectionA: colA, docB: docB)
            .then((value) {
          auditTableData.value = value;
          auditTableData.refresh();
          isLoading.value = false;
        });
      } else {
        isLoading.value = false;
      }
    }).timeout(Duration(seconds: 20));
  }
}
