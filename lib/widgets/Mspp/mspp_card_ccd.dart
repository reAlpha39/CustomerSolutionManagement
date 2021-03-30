import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/Mspp/mspp_result.dart';
import 'package:customer/widgets/Mspp/mspp_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppCardCcd extends StatelessWidget {
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
                    'Compile & Compute Data',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                collapsed: Container(),
                expanded: ExpandedCcdData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedCcdData extends StatelessWidget {
  final MsppController controller = MsppController.to;

  Future<bool> resultRadio({int index}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: 'Pilih salah satu',
        content: (MsppResult(
          data: ['Yes', 'No', 'N/A'],
          index: index,
          id: 'ccd',
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
          controller.textFieldPI('ccd')[index] =
              controller.textEditingControllerALL.text;
          controller.textEditingControllerALL.clear();
          Get.back(closeOverlays: false);
        });
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
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 0);
                    },
                    child: Obx(() => Text(controller.radioIndexCCD[0] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexCCD[0]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 0);
                    },
                    child: Obx(() => Text(controller.textFieldCCD[0] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldCCD[0]}")),
                  )),
                  DataCell(Text('1.2.1.1.a')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah sudah ada standard lead time pekerjaan PS untuk masing masing type PS dan unit model ?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Melihat apakah ada standart penentuan tipe PS dan durasi untuk pembuatan plan PS'),
                    ),
                  ),
                  DataCell(
                    Text('File Planning PS'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 1);
                    },
                    child: Obx(() => Text(controller.radioIndexCCD[1] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexCCD[1]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 1);
                    },
                    child: Obx(() => Text(controller.textFieldCCD[1] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldCCD[1]}")),
                  )),
                  DataCell(Text('1.2.1.1.b')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah sudah ada pembagian area kerja dan target eksekusi untuk masing masing type PS dan unit model?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    SingleChildScrollView(
                      child: Container(
                        width: 160,
                        child: Column(
                          children: [
                            Text(
                                '- Observasi ke lapangan untuk melihat apakah ada pembagian area kerja kepada mekanik'),
                            Text(''),
                            Text('- Melihat apakah ada target waktu eksekusi')
                          ],
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Column(
                      children: [
                        Text('Hasil observasi ke lapangan'),
                        Text(''),
                        Text('JSS')
                      ],
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 2);
                    },
                    child: Obx(() => Text(controller.radioIndexCCD[2] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexCCD[2]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 2);
                    },
                    child: Obx(() => Text(controller.textFieldCCD[2] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldCCD[2]}")),
                  )),
                  DataCell(Text('1.2.1.2')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah sudah ada list standard kebutuhan Part & Lubrication untuk setiap type PS di masing masing unit?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Melihat apakah sudah ada standart part list setiap tipe PS'),
                    ),
                  ),
                  DataCell(
                    Text('File Planning PS'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 3);
                    },
                    child: Obx(() => Text(controller.radioIndexCCD[3] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexCCD[3]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 3);
                    },
                    child: Obx(() => Text(controller.textFieldCCD[3] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldCCD[3]}")),
                  )),
                  DataCell(Text('1.2.1.3.a')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah sudah ada standard template untuk pembuatan Plan Periodik Service?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Melihat apakah sudah ada template yang standart untuk pembuatan Plan PS'),
                    ),
                  ),
                  DataCell(
                    Text('File Planning PS'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 4);
                    },
                    child: Obx(() => Text(controller.radioIndexCCD[4] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexCCD[4]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 4);
                    },
                    child: Obx(() => Text(controller.textFieldCCD[4] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldCCD[4]}")),
                  )),
                  DataCell(Text('1.2.1.3.b')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah PS yang sudah terlaksana di update pada template tersebut secara rutin?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text('Melihat file plan PS '),
                    ),
                  ),
                  DataCell(
                    Text('Interview dengan tim planner'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 5);
                    },
                    child: Obx(() => Text(controller.radioIndexCCD[5] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexCCD[5]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 5);
                    },
                    child: Obx(() => Text(controller.textFieldCCD[5] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldCCD[5]}")),
                  )),
                  DataCell(Text('1.2.1.4.a')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah sudah ada standard template Backlog Monitoring ?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Melihat apakah sudah ada format standart untuk backlog monitoring'),
                    ),
                  ),
                  DataCell(
                    Text('File Planning PS'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 6);
                    },
                    child: Obx(() => Text(controller.radioIndexCCD[6] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexCCD[6]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 6);
                    },
                    child: Obx(() => Text(controller.textFieldCCD[6] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldCCD[6]}")),
                  )),
                  DataCell(Text('1.2.1.4.b')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah setiap temuan backlog baru di update pada template tersebut secara rutin?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text('Melihat file backlog monitoring'),
                    ),
                  ),
                  DataCell(
                    Text('File Planning PS'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 7);
                    },
                    child: Obx(() => Text(controller.radioIndexCCD[7] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexCCD[7]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 7);
                    },
                    child: Obx(() => Text(controller.textFieldCCD[7] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldCCD[7]}")),
                  )),
                  DataCell(Text('1.2.1.4.c')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah Backlog yang sudah dikerjakan di update pada template tersebut secara rutin?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text('Melihat file backlog monitoring'),
                    ),
                  ),
                  DataCell(
                    Text('File Planning PS'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 8);
                    },
                    child: Obx(() => Text(controller.radioIndexCCD[8] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexCCD[8]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 8);
                    },
                    child: Obx(() => Text(controller.textFieldCCD[8] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldCCD[8]}")),
                  )),
                  DataCell(Text('1.2.1.5.a')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah sudah ada standard template untuk pencatatan SMR unit dan menentukan rata rata jam operasinya ?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Melihat apakah SMR dan adjustment average SMR sudah update pada file Planning PS'),
                    ),
                  ),
                  DataCell(
                    Column(
                      children: [
                        Text('- File Planning PS'),
                        Text('- Data backlog')
                      ],
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 9);
                    },
                    child: Obx(() => Text(controller.radioIndexCCD[9] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexCCD[9]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 9);
                    },
                    child: Obx(() => Text(controller.textFieldCCD[9] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldCCD[9]}")),
                  )),
                  DataCell(Text('1.2.1.5.b')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah SMR unit diupdate secara rutin pada template tersebut ?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text('Melihat file planning PS'),
                    ),
                  ),
                  DataCell(
                    Column(
                      children: [
                        Text('- File Planning PS'),
                        Text('- Data backlog')
                      ],
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 10);
                    },
                    child: Obx(() => Text(controller.radioIndexCCD[10] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexCCD[10]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 10);
                    },
                    child: Obx(() => Text(controller.textFieldCCD[10] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldCCD[10]}")),
                  )),
                  DataCell(Text('1.2.1.5.c')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah rata rata jam operasi untuk pembuatan planning PS menggunakan data rata rata jam operasi yang update ?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Melihat apakah draft next service terupdate sesuai last HM,  rata-rata jam operasi seminggu terakhir'),
                    ),
                  ),
                  DataCell(
                    Text('File Planning PS'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 11);
                    },
                    child: Obx(() => Text(controller.radioIndexCCD[11] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexCCD[11]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 11);
                    },
                    child: Obx(() => Text(controller.textFieldCCD[11] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldCCD[11]}")),
                  )),
                  DataCell(Text('1.2.1.6')),
                  DataCell(
                    SingleChildScrollView(
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah draft plan service dibuat berdasarkan pada data last service, last HM, rata-rata jam operasi seminggu terakhir dan  data backlog yang terupdate? '),
                      ),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    SingleChildScrollView(
                      child: Container(
                        width: 160,
                        child: Text(
                            'Melihat apakah draft next service terupdate sesuai last HM,  rata-rata jam operasi seminggu terakhir, dan data backlog terupdate dengan melihat sheet PS schedule dan BMS Template'),
                      ),
                    ),
                  ),
                  DataCell(
                    Column(
                      children: [
                        Text('- Planning PS templates'),
                        Text('- Template Backlog Monitoring Sheet')
                      ],
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 12);
                    },
                    child: Obx(() => Text(controller.radioIndexCCD[12] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexCCD[12]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 12);
                    },
                    child: Obx(() => Text(controller.textFieldCCD[12] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldCCD[12]}")),
                  )),
                  DataCell(Text('1.2.1.7.a')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah WO backlog dibuat maksimum 2 hari dari tanggal temuan ?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Melihat apakah WO dibuat maksimum 2 hari dari tanggal temuan'),
                    ),
                  ),
                  DataCell(
                    Text('Dokumen WO untuk backlog'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 13);
                    },
                    child: Obx(() => Text(controller.radioIndexCCD[13] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexCCD[13]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 13);
                    },
                    child: Obx(() => Text(controller.textFieldCCD[13] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldCCD[13]}")),
                  )),
                  DataCell(Text('1.2.1.7.b')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah No WO dan status parts ordernya diupdate di BMS ?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text('Melihat Backlog Monitoring Sheet'),
                    ),
                  ),
                  DataCell(
                    Text('File backlog monitoring'),
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
