import 'package:customer/models/audit_table_data.dart';
import 'package:customer/models/iw_data_table.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:get/get.dart';

class DataTableController extends GetxController {
  final DatabaseProvider _databaseProvider = DatabaseProvider();

  Rx<AuditTableData> auditTableData = AuditTableData().obs;
  Rx<IwDataTable> iwDataTable = IwDataTable().obs;
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
            if (value.runtimeType == AuditTableData) {
              _msppfilterTable(
                  data: value, radioIndex: radioIndex, listRadio: listRadio);
            } else {
              _iwfilterTable(
                  data: value, radioIndex: radioIndex, listRadio: listRadio);
            }
          } else {
            if (value.runtimeType == AuditTableData) {
              auditTableData.value = value;
              auditTableData.refresh();
            } else {
              iwDataTable.value = value;
              iwDataTable.refresh();
            }
            isLoading.value = false;
          }
        });
      } else {
        isLoading.value = false;
      }
    }).timeout(Duration(seconds: 20));
  }

  void _iwfilterTable(
      {IwDataTable data, int radioIndex, RxList<int> listRadio}) {
    isLoading.value = true;
    IwDataTable tableData = IwDataTable();
    tableData.description = [];
    tableData.dimension = [];
    tableData.id = [];
    tableData.element = [];
    tableData.noKlausul = [];

    if (listRadio != null) {
      for (int i = 0; i <= listRadio.length - 1; i++) {
        if (listRadio[i] == radioIndex) {
          tableData.description.add(data.description[i]);
          tableData.dimension.add(data.dimension[i]);
          tableData.id.add(data.id[i]);
          tableData.element.add(data.element[i]);
          tableData.noKlausul.add(data.noKlausul[i]);
        }
      }
      iwDataTable.value = tableData;
      iwDataTable.refresh();
      isLoading.value = false;
    }
  }

  _msppfilterTable(
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
