import 'package:customer/controller/part_program_controller.dart';
import 'package:customer/widgets/part_program/part_result.dart';
import 'package:customer/widgets/part_program/part_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartOpCard extends StatelessWidget {
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
                    'Operations',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                collapsed: Container(),
                expanded: ExpandedOpData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedOpData extends StatelessWidget {
  final PartProgramController controller = Get.find();

  Future<bool> resultRadio({int index}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: 'Pilih salah satu',
        content: (PartResult(
          data: ['Yes', 'No', 'N/A'],
          index: index,
          id: 'op',
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
          controller.textFieldPP('op')[index] =
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
      child: Obx(() => Text(controller.textFieldOP[id] == ""
          ? 'Klik disini'
          : "${controller.textFieldOP[id]}")),
    );
  }

  TextButton buildTextButtonAssessment(int id) {
    return TextButton(
      onPressed: () {
        resultRadio(index: id);
      },
      child: Obx(() => Text(controller.radioIndexOP[id] == -1
          ? 'Pilih disini'
          : '${controller.radioData[controller.radioIndexOP[id]]}')),
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
              DataColumn(label: Text('No. Klausul')),
              DataColumn(label: Text('Dimension')),
              DataColumn(label: Text('Element')),
              DataColumn(label: Text('Description')),
              DataColumn(label: Text('Assessment Result 1')),
              DataColumn(label: Text('Remark')),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text('1.1.2.1')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah  briefing di awal shift dilakukan sebelum melakukan inspeksi ?'),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('SPV/GL'),
                  )),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Column(
                            children: [
                              Text(
                                  '- Memastikan Agenda PI briefing sudah dibuat di meeting record sesuai dengan agenda'),
                              Text(''),
                              Text(
                                  '- Melihat daftar absensi di meeting record apakah diisi dan di tanda tangani oleh peserta yang hadir'),
                              Text(''),
                              Text(
                                  '- Memastikan apakah dokumen PI diserahkan kepada mekanik setelah briefing awal shift')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  DataCell(buildTextButtonAssessment(0)),
                  DataCell(buildTextButtonRemark(0)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
