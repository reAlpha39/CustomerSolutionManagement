import 'package:customer/controller/data_table_controller.dart';
import 'package:customer/controller/part_program_controller.dart';
import 'package:customer/widgets/part_program/part_result.dart';
import 'package:customer/widgets/part_program/part_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartKpCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: ExpandableNotifier(
            child: ScrollOnExpand(
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: false,
                  hasIcon: true,
                ),
                header: Container(
                  child: Text(
                    'Ketersediaan Part',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                collapsed: Container(),
                expanded: ExpandedKpData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedKpData extends StatelessWidget {
  final PartProgramController controller = Get.find();
  final DataTableController dtController = Get.find();

  Future<bool> resultRadio({int index}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: 'Pilih salah satu',
        content: (PartResult(
          data: ['Yes', 'No', 'N/A'],
          index: index,
          id: 'kp',
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
        content: PartTextField(),
        textConfirm: 'OK',
        buttonColor: Color(0xffffcd29),
        confirmTextColor: Colors.black87,
        onConfirm: () {
          controller.textFieldPP('kp')[index] =
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
      child: Obx(() => Text(controller.textFieldKP[id] == ""
          ? 'Klik disini'
          : "${controller.textFieldKP[id]}")),
    );
  }

  TextButton buildTextButtonAssessment(int id) {
    return TextButton(
      onPressed: () {
        resultRadio(index: id);
      },
      child: Obx(() => Text(controller.radioIndexKP[id] == -1
          ? 'Pilih disini'
          : '${controller.radioData[controller.radioIndexKP[id]]}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    dtController.loadDataTable(
      docA: 'part_program',
      colA: 'ketersediaan_part',
      docB: 'kp',
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
                      DataColumn(label: Text('Assessment Result')),
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
                          DataCell(Padding(
                            padding: const EdgeInsets.only(top: 7, bottom: 7),
                            child: Text(
                                '${dtController.auditTableData.value.pic[index]}'),
                          )),
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
