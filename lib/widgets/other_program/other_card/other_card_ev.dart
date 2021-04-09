import 'package:customer/controller/other_program_controller.dart';
import 'package:customer/widgets/other_program/other_result.dart';
import 'package:customer/widgets/other_program/other_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherCardEv extends StatelessWidget {
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
                    'Evaluasi Vendor',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                collapsed: Container(),
                expanded: ExpandedEvData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedEvData extends StatelessWidget {
  final OtherProgramController controller = Get.find();

  Future<bool> resultRadio({int index}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: 'Pilih salah satu',
        content: (OtherResult(
          data: ['Yes', 'No', 'N/A'],
          index: index,
          id: 'ev',
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
          controller.textFieldOP('ev')[index] =
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
      child: Obx(() => Text(controller.textFieldEV[id] == ""
          ? 'Klik disini'
          : "${controller.textFieldEV[id]}")),
    );
  }

  TextButton buildTextButtonAssessment(int id) {
    return TextButton(
      onPressed: () {
        resultRadio(index: id);
      },
      child: Obx(() => Text(controller.radioIndexEV[id] == -1
          ? 'Pilih disini'
          : '${controller.radioData[controller.radioIndexEV[id]]}')),
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
                  DataCell(Text('13.3.1')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah terdapat jadwal evaluasi vendor '),
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
                            Text('Purchasing'),
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
                              Text('Melihat apakah ada jadwal evaluasi vendor'),
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
                            Text('Jadwal evaluasi vendor'),
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
                  DataCell(Text('13.3.2')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah terdapat kualifikasi standart untuk melakukan evaluasi vendor?'),
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
                            Text('Purchasing'),
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
                                  'Melihat apakah ada kualifikasi standard untuk melakukan evaluasi vendor'),
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
                            Text('List standard kualifikasi vendor'),
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
                  DataCell(Text('13.3.3')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah terdapat schedule fix untuk melakukan evaluasi vendor (setiap 6 bulan)?'),
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
                            Text('Purchasing'),
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
                                  'Melihat apakah evaluasi vendor dijalankan secara rutin'),
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
                            Text('MOM evaluasi vendor'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(3)),
                  DataCell(buildTextButtonRemark(3)),
                  DataCell(Text('13.3.4')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah ada daftar peringkat vendor berdasarkan kriteria harga, kualitas, warranty dan leadtime?'),
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
                            Text('Purchasing'),
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
                              Text('Melihat apakah ada data peringkat vendor'),
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
                            Text(
                                'List peringkat vendor berdasarkan Harga, Kualitas, Warranty dan Leadtme'),
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
