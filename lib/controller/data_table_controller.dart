import 'package:customer/models/audit_table_data.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:get/get.dart';

class DataTableController extends GetxController {
  final DatabaseProvider _databaseProvider = DatabaseProvider();

  Rx<AuditTableData> auditTableData = AuditTableData().obs;
  RxBool isLoading = false.obs;

  loadDataTable(
      {String docA,
      String colA,
      String docB,
      bool filter = false,
      RxList<int> listRadio,
      int radioIndex}) {
    isLoading.value = true;
    connectivityChecker().then((conn) {
      if (conn) {
        _databaseProvider
            .auditDataTable(docA: docA, collectionA: colA, docB: docB)
            .then((value) {
          if (filter) {
            filterTable(data: value, radioIndex: radioIndex, listRadio: listRadio);
          } else {
            auditTableData.value = value;
            auditTableData.refresh();
            isLoading.value = false;
          }
        });
      } else {
        isLoading.value = false;
      }
    }).timeout(Duration(seconds: 20));
  }

  filterTable(
      {AuditTableData data, int radioIndex, RxList<int> listRadio}) {
    isLoading.value = true;
    AuditTableData tableData = AuditTableData();
    tableData.description = [];
    tableData.guidance = [];
    tableData.id = [];
    tableData.noKlause = [];
    tableData.objectiveEvidence = [];
    tableData.pic = [];

    if (listRadio != null) {
      for (int i = 0; i <= listRadio.length - 1; i++) {
        if (listRadio[i] == radioIndex) {
          tableData.description.add(data.description[i]);
          tableData.guidance.add(data.guidance[i]);
          tableData.id.add(data.id[i]);
          tableData.noKlause.add(data.noKlause[i]);
          tableData.objectiveEvidence.add(data.objectiveEvidence[i]);
          tableData.pic.add(data.pic[i]);
        }
      }
      auditTableData.value = tableData;
      auditTableData.refresh();
      isLoading.value = false;
    }
  }
}
