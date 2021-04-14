import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/models/audit_table_data.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:get/get.dart';

class DataTableController extends GetxController {
  final DatabaseProvider _databaseProvider = DatabaseProvider();
  final MsppController controller = Get.find();

  Rx<AuditTableData> auditTableData = AuditTableData().obs;
  RxBool isLoading = false.obs;

  loadDataTable(
      {String docA,
      String colA,
      String docB,
      bool filter = false,
      String idRadio,
      int radioIndex}) {
    isLoading.value = true;
    connectivityChecker().then((conn) {
      if (conn) {
        _databaseProvider
            .auditDataTable(docA: docA, collectionA: colA, docB: docB)
            .then((value) {
          if (filter) {
            filterTable(data: value, id: idRadio, radioIndex: radioIndex);
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

  filterTable({AuditTableData data, String id, int radioIndex}) {
    isLoading.value = true;
    AuditTableData tableData = AuditTableData();
    tableData.description = [];
    tableData.guidance = [];
    tableData.id = [];
    tableData.noKlause = [];
    tableData.objectiveEvidence = [];
    tableData.pic = [];
    controller.radioIndexPI(id).refresh();

    if (controller.radioIndexPI(id) != null) {
      for (int i = 0; i <= controller.radioIndexPI(id).length - 1; i++) {
        if (controller.radioIndexPI(id)[i] == radioIndex) {
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
