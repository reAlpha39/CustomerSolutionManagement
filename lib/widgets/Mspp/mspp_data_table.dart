import 'package:customer/controller/data_table_controller.dart';
import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/mspp/mspp_result.dart';
import 'package:customer/widgets/mspp/mspp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppDataTable extends StatelessWidget {
  final MsppController controller = Get.find();
  final DataTableController dtController = Get.find();
  final List<int> radioIndex;
  final List<String> textFieldIndex;
  final String id;
  final String docA;
  final String docB;
  final String colA;
  final bool dataTableFilter;
  final RxList<int> dataTableListRadio;
  final int dataTableRadioIndex;

  MsppDataTable({
    Key key,
    this.radioIndex,
    this.textFieldIndex,
    this.docA,
    this.docB,
    this.colA,
    this.dataTableFilter = false,
    this.id,
    this.dataTableListRadio,
    this.dataTableRadioIndex,
  }) : super(key: key);

  Future<bool> resultRadio({int index}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: 'Pilih salah satu',
        content: (MsppResult(
          data: ['Yes', 'No', 'N/A'],
          index: index,
          id: id,
        )),
        textConfirm: 'OK',
        buttonColor: Color(0xffffcd29),
        confirmTextColor: Colors.black87,
        onConfirm: () => Get.back(closeOverlays: false));
  }

  Future<bool> resultTextField({int index}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: 'Remark',
        content: MsppTextField(),
        textConfirm: 'OK',
        buttonColor: Color(0xffffcd29),
        confirmTextColor: Colors.black87,
        onConfirm: () {
          controller.textFieldPI(id)[index] =
              controller.textEditingControllerALL.text;
          controller.textEditingControllerALL.clear();
          Get.back(closeOverlays: false);
        });
  }

  TextButton buildTextButtonRemark(int id) {
    return TextButton(
      onPressed: () {
        resultTextField(index: id);
      },
      child: Obx(
        () => Text(
            textFieldIndex[id] == "" ? 'Klik disini' : "${textFieldIndex[id]}"),
      ),
    );
  }

  TextButton buildTextButtonAssessment(int id) {
    return TextButton(
      onPressed: () {
        resultRadio(index: id);
      },
      child: Obx(() => Text(radioIndex[id] == -1
          ? 'Pilih disini'
          : '${controller.radioData[radioIndex[id]]}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    dtController.loadDataTable(
      docA: '$docA',
      colA: '$colA',
      docB: '$docB',
      filter: dataTableFilter,
      listRadio: dataTableListRadio,
      radioIndex: dataTableRadioIndex,
    );
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Obx(
        () => dtController.auditTableData.value.id == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scrollbar(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dataRowHeight: 100,
                    columns: [
                      DataColumn(label: Text('No. Klausul')),
                      DataColumn(label: Text('Deskripsi')),
                      DataColumn(label: Text('PIC')),
                      DataColumn(label: Text('Guidance')),
                      DataColumn(label: Text('Objective Evidence')),
                      DataColumn(label: Text('Assessment Result 1')),
                      DataColumn(label: Text('Remark')),
                    ],
                    rows: List<DataRow>.generate(
                      dtController.auditTableData.value.id.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text(
                              '${dtController.auditTableData.value.noKlause[index]}')),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Container(
                                width: 160,
                                child: Text(
                                    '${dtController.auditTableData.value.description[index]}'),
                              ),
                            ),
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Text(
                                  '${dtController.auditTableData.value.pic[index]}'),
                            ),
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Container(
                                width: 160,
                                child: Text(
                                    '${dtController.auditTableData.value.guidance[index]}'),
                              ),
                            ),
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Text(
                                  '${dtController.auditTableData.value.objectiveEvidence[index]}'),
                            ),
                          ),
                          DataCell(
                            buildTextButtonAssessment(
                              dtController.auditTableData.value.id[index],
                            ),
                          ),
                          DataCell(
                            buildTextButtonRemark(
                              dtController.auditTableData.value.id[index],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
