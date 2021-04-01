import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/Mspp/mspp_result.dart';
import 'package:customer/widgets/Mspp/mspp_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppCardEds extends StatelessWidget {
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
                    'Enter Data into System',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                collapsed: Container(),
                expanded: ExpandedMeetData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedMeetData extends StatelessWidget {
  final MsppController controller = Get.find();

  Future<bool> resultRadio({int index}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: 'Pilih salah satu',
        content: (MsppResult(
          data: ['Yes', 'No', 'N/A'],
          index: index,
          id: 'eds',
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
          controller.textFieldPI('eds')[index] =
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
      child: Obx(() => Text(controller.textFieldEDS[id] == ""
          ? 'Klik disini'
          : "${controller.textFieldEDS[id]}")),
    );
  }

  TextButton buildTextButtonAssessment(int id) {
    return TextButton(
      onPressed: () {
        resultRadio(index: id);
      },
      child: Obx(() => Text(controller.radioIndexEDS[id] == -1
          ? 'Pilih disini'
          : '${controller.radioData[controller.radioIndexEDS[id]]}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            dataRowHeight: 100,
            columns: [
              DataColumn(label: Text('Assessment Result 1')),
              DataColumn(label: Text('Remark')),
              DataColumn(label: Text('No. Klausul')),
              DataColumn(label: Text('Deskripsi')),
              DataColumn(label: Text('PIC')),
              DataColumn(label: Text('Guidance')),
              DataColumn(label: Text('Objective Evidence')),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(0)),
                  DataCell(buildTextButtonRemark(0)),
                  DataCell(Text('1.3.6.1.a')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah dokumen PS sudah diinput ke Kpi data base ?'),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom:7),
                    child: Text('Planner/Adm Planner'),
                  )),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Melihat apakah dokumen periodic service diinput ke database maksimal 2 hari setelah pekerjaan PS selesai'),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Text('Visual Check KPI data base'),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(1)),
                  DataCell(buildTextButtonRemark(1)),
                  DataCell(Text('1.3.6.1.b')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah problem log sudah diinput ke database ?'),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom:7),
                    child: Text('Planner/Adm Planner'),
                  )),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Melihat apakah data problem log diinput ke database maksimal satu hari setelah pekerjaan PS selesai'),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                          width: 160,
                          child: Text('Visual check database problem log')),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(2)),
                  DataCell(buildTextButtonRemark(2)),
                  DataCell(Text('1.3.6.2')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah atas pekerjaan yang sudah selesai dilakukan closing WO-nya ?'),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom:7),
                    child: Text('Team PS'),
                  )),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Melihat apakah selalu dilakukan closing WO setiap selesai pekerjaan'),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Text('Tanggal closing WO'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
