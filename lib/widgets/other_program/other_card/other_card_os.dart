import 'package:customer/controller/other_program_controller.dart';
import 'package:customer/widgets/other_program/other_result.dart';
import 'package:customer/widgets/other_program/other_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherCardOs extends StatelessWidget {
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
                    'Organization Structure',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                collapsed: Container(),
                expanded: ExpandedOsData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedOsData extends StatelessWidget {
  final OtherProgramController controller = Get.find();

  Future<bool> resultRadio({int index}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: 'Pilih salah satu',
        content: (OtherResult(
          data: ['Yes', 'No', 'N/A'],
          index: index,
          id: 'os',
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
        content: OtherTextField(),
        textConfirm: 'OK',
        buttonColor: Color(0xffffcd29),
        confirmTextColor: Colors.black87,
        onConfirm: () {
          controller.textFieldOP('os')[index] =
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
      child: Obx(() => Text(controller.textFieldOS[id] == ""
          ? 'Klik disini'
          : "${controller.textFieldOS[id]}")),
    );
  }

  TextButton buildTextButtonAssessment(int id) {
    return TextButton(
      onPressed: () {
        resultRadio(index: id);
      },
      child: Obx(() => Text(controller.radioIndexOS[id] == -1
          ? 'Pilih disini'
          : '${controller.radioData[controller.radioIndexOS[id]]}')),
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
                  DataCell(Text('12.1.1')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah struktur organisasi  sudah mencakup Department: Plant, Logistic, Operation, Development, Administration dan SHE?'),
                        ),
                      ),
                    ),
                  ),
                  DataCell(SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Container(
                        width: 160,
                        child: Column(
                          children: [
                            Text('Site Manager'),
                          ],
                        ),
                      ),
                    ),
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
                                  'Melihat apakah sudah ada struktur organisasi'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  DataCell(SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Container(
                        width: 160,
                        child: Column(
                          children: [
                            Text('Struktur organisasi customer'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(1)),
                  DataCell(buildTextButtonRemark(1)),
                  DataCell(Text('12.1.2')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah  sudah terdapat tugas dan tanggung jawab untuk masing-masing department?'),
                        ),
                      ),
                    ),
                  ),
                  DataCell(SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Container(
                        width: 160,
                        child: Column(
                          children: [
                            Text('Site Manager'),
                          ],
                        ),
                      ),
                    ),
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
                                  '- Melihat apakah sudah ada tugas dan tanggung jawab untuk setiap departement'),
                              Text(''),
                              Text('- Interview dengan site manager'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  DataCell(SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Container(
                        width: 160,
                        child: Column(
                          children: [
                            Text('File Rules & Responsibility'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(2)),
                  DataCell(buildTextButtonRemark(2)),
                  DataCell(Text('12.1.3')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah  apakah KPI masing-masing department sudah ditetapkan? '),
                        ),
                      ),
                    ),
                  ),
                  DataCell(SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Container(
                        width: 160,
                        child: Column(
                          children: [
                            Text('Site Manager'),
                          ],
                        ),
                      ),
                    ),
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
                                  'Melihat apakah sudah ada KPI untuk setiap departement'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  DataCell(SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Container(
                        width: 160,
                        child: Column(
                          children: [
                            Text('KPI setiap departement'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
