import 'package:customer/controller/data_table_controller.dart';
import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_result.dart';
import 'package:customer/widgets/mspp/mspp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppDataTable extends StatelessWidget {
  final MsppController controller = Get.find();
  final DataTableController dtController = Get.find();
  final PicaCardTableController picaCTController = Get.find(tag: 'global');
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
    controller.loadItem(
        docA: colA, docB: id, index: index, isAssessmentResult: true);
    return Get.defaultDialog(
      barrierDismissible: false,
      radius: 17,
      title: 'Pilih salah satu',
      content: (MsppResult(
        data: ['Yes', 'No', 'N/A'],
        index: index,
        colA: colA,
        id: id,
      )),
      textConfirm: 'OK',
      buttonColor: Color(0xffffcd29),
      confirmTextColor: Colors.black87,
      onConfirm: () {
        controller.saveItem(
            docA: colA, docB: id, index: index, isAssessmentResult: true);
        // picaCTController.checkData(radioIndex[index], id, index);
        Get.back(closeOverlays: false);
      },
    );
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
          controller.saveItem(
              docA: colA, docB: id, index: index, isAssessmentResult: false);
          Get.back(closeOverlays: false);
        });
  }

  TextButton buildTextButtonRemark(int index) {
    return TextButton(
      onPressed: () {
        resultTextField(index: index);
      },
      child: Obx(() {
        String res = controller.loadItem(
            docA: colA, docB: id, index: index, isAssessmentResult: false);
        if (res == "") {
          return Text('Pilih disini');
        } else {
          return Text(res);
        }
      }),
    );
  }

  TextButton buildTextButtonAssessment(int index) {
    return TextButton(
      onPressed: () {
        resultRadio(index: index);
      },
      child: Obx(
        () {
          int res = controller.loadItem(
              docA: colA, docB: id, index: index, isAssessmentResult: true);
          if (res == -1) {
            return Text('Pilih disini');
          } else {
            return Text(controller.radioData[res]);
          }
        },
      ),
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
                              '${dtController.auditTableData.value.noKlause[index].replaceAll("\\n", "\n")}')),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Container(
                                width: 160,
                                child: ScrollConfiguration(
                                  behavior: CustomScrollBehavior(),
                                  child: SingleChildScrollView(
                                    child: Text(
                                        '${dtController.auditTableData.value.description[index].replaceAll("\\n", "\n")}'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: ScrollConfiguration(
                                behavior: CustomScrollBehavior(),
                                child: SingleChildScrollView(
                                  child: Text(
                                      '${dtController.auditTableData.value.pic[index].replaceAll("\\n", "\n")}'),
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Container(
                                width: 160,
                                child: ScrollConfiguration(
                                  behavior: CustomScrollBehavior(),
                                  child: SingleChildScrollView(
                                    child: Text(
                                        '${dtController.auditTableData.value.guidance[index].replaceAll("\\n", "\n")}'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: ScrollConfiguration(
                                behavior: CustomScrollBehavior(),
                                child: SingleChildScrollView(
                                  child: Container(
                                    width: 160,
                                    child: Text(
                                        '${dtController.auditTableData.value.objectiveEvidence[index].replaceAll("\\n", "\n")}'),
                                  ),
                                ),
                              ),
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
