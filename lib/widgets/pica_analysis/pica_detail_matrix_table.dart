import 'package:customer/controller/data_table_controller.dart';
import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/pica_analysis/pica_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaDetailMatrixTable extends StatelessWidget {
  final HomeController _homeController = Get.find();
  final DataTableController dtController = Get.find();
  final PicaCardTableController listCardController = Get.find(tag: 'global');
  final List<String> data = ['0', '1', '2', '3', '4', '5'];
  final String? tag;

  PicaDetailMatrixTable({Key? key, this.tag}) : super(key: key);

  TextButton textButton(int id, String name) {
    final PicaCardTableController controllerPU = Get.find(tag: tag);
    return TextButton(
      onPressed: () {
        resultTextField(index: id, name: name);
      },
      child: Obx(() {
        var listText = _homeController
            .tempListChecklistAudit
            .value
            .checklistAudit![controllerPU.indexData.value]
            .checklistElement![controllerPU.indexCard.value]
            .checklistData;
        String? text = "Klik disini";
        if (name == "Actual") {
          if (listText![id].actual != "") {
            text = listText[id].actual;
          }
        } else if (name == "Target") {
          if (listText![id].target != "") {
            text = listText[id].target;
          }
        } else if (name == "Priority") {
          if (listText![id].improv != "") {
            text = listText[id].improv;
          }
        }
        return Text(text!);
      }),
    );
  }

  Future<bool?> resultTextField({int? index, required String name}) {
    final PicaCardTableController controllerPU = Get.find(tag: tag);
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: name,
        content: PicaTextField(
          tag: tag,
        ),
        textConfirm: 'OK',
        buttonColor: Color(0xffffcd29),
        confirmTextColor: Colors.black87,
        onConfirm: () {
          listCardController.fillTextData(controllerPU.indexData.value,
              controllerPU.indexCard.value, index, name);
          Get.back(closeOverlays: false);
        });
  }

  @override
  Widget build(BuildContext context) {
    final PicaCardTableController controllerPU = Get.find(tag: tag);
    dtController.loadDataTable(
      docA: controllerPU.docA.value,
      colA: controllerPU.colA.value,
      docB: controllerPU.docB.value,
      filter: controllerPU.dataTableFilter.value,
      listRadio: controllerPU.dataTableListRadio,
      radioIndex: controllerPU.dataTableRadioIndex,
    );
    controllerPU.displayIndex(
        controllerPU.indexCard.value, controllerPU.indexData.value,
        isGlobal: false, tag: tag);
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Obx(
        () => dtController.auditTableData.value!.id == null
            ? dtController.iwDataTable.value!.id == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        dataRowHeight: 100,
                        columns: [
                          DataColumn(label: Text('Deskripsi Problem')),
                          DataColumn(label: Text('Actual')),
                          DataColumn(label: Text('Target')),
                          DataColumn(label: Text('Prioritas Improve')),
                        ],
                        rows: List<DataRow>.generate(
                          dtController.iwDataTable.value!.id!.length,
                          (index) => DataRow(
                            cells: [
                              _dataCell(index, 0),
                              _cellInput(index, 0),
                              _cellInput(index, 1),
                              _cellInput(index, 2),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
            : Scrollbar(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dataRowHeight: 100,
                    columns: [
                      DataColumn(label: Text('Deskripsi Problem')),
                      DataColumn(label: Text('PIC')),
                      DataColumn(label: Text('Actual')),
                      DataColumn(label: Text('Target')),
                      DataColumn(label: Text('Prioritas Improve')),
                    ],
                    rows: List<DataRow>.generate(
                      dtController.auditTableData.value!.id!.length,
                      (index) => DataRow(
                        cells: [
                          _dataCell(index, 0),
                          _dataCell(index, 1),
                          _cellInput(index, 0),
                          _cellInput(index, 1),
                          _cellInput(index, 2),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  DataCell _cellInput(int index, int indexCell) {
    List<int> listId;
    DataCell? widget;
    if (dtController.iwDataTable.value!.id != null) {
      listId = dtController.iwDataTable.value!.id!;
    } else {
      listId = dtController.auditTableData.value!.id!;
    }
    switch (indexCell) {
      case 0:
        widget = DataCell(
          textButton(listId[index], "Actual"),
        );
        break;
      case 1:
        widget = DataCell(
          textButton(listId[index], "Target"),
        );
        break;
      case 2:
        widget = DataCell(
          textButton(listId[index], "Priority"),
        );
        break;
      default:
    }
    return widget!;
  }

  DataCell _dataCell(int index, int indexCell) {
    DataCell? widget;
    switch (indexCell) {
      case 0:
        widget = DataCell(
          Padding(
            padding: const EdgeInsets.only(top: 7, bottom: 7),
            child: Container(
              width: 160,
              child: ScrollConfiguration(
                behavior: CustomScrollBehavior(),
                child: SingleChildScrollView(
                  child: dtController.iwDataTable.value!.id != null
                      ? Text(
                          dtController.iwDataTable.value!.description![index]
                              .replaceAll("\\n", "\n"),
                        )
                      : Text(
                          dtController.auditTableData.value!.description![index]
                              .replaceAll("\\n", "\n"),
                        ),
                ),
              ),
            ),
          ),
        );
        break;
      case 1:
        widget = DataCell(
          Padding(
            padding: const EdgeInsets.only(top: 7, bottom: 7),
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: SingleChildScrollView(
                child: Text(dtController.auditTableData.value!.pic![index]
                    .replaceAll("\\n", "\n")),
              ),
            ),
          ),
        );
        break;
      default:
    }
    return widget!;
  }
}
