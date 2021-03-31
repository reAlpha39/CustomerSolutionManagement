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

  TextButton buildTextButtonRemark(int id) {
    return TextButton(
      onPressed: () {
        resultTextField(index: id);
      },
      child: Obx(() => Text(controller.textFieldCCD[id] == ""
          ? 'Klik disini'
          : "${controller.textFieldCCD[id]}")),
    );
  }

  TextButton buildTextButtonAssesment(int id) {
    return TextButton(
      onPressed: () {
        resultRadio(index: id);
      },
      child: Obx(() => Text(controller.radioIndexCCD[id] == -1
          ? 'Pilih disini'
          : '${controller.radioData[controller.radioIndexCCD[id]]}')),
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
                  DataCell(buildTextButtonAssesment(0)),
                  DataCell(buildTextButtonRemark(0)),
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
                  DataCell(buildTextButtonAssesment(1)),
                  DataCell(buildTextButtonRemark(1)),
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
                  DataCell(buildTextButtonAssesment(2)),
                  DataCell(buildTextButtonRemark(2)),
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
                  DataCell(buildTextButtonAssesment(3)),
                  DataCell(buildTextButtonRemark(3)),
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
                  DataCell(buildTextButtonAssesment(4)),
                  DataCell(buildTextButtonRemark(4)),
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
                  DataCell(buildTextButtonAssesment(5)),
                  DataCell(buildTextButtonRemark(5)),
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
                  DataCell(buildTextButtonAssesment(6)),
                  DataCell(buildTextButtonRemark(6)),
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
                  DataCell(buildTextButtonAssesment(7)),
                  DataCell(buildTextButtonRemark(7)),
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
                  DataCell(buildTextButtonAssesment(8)),
                  DataCell(buildTextButtonRemark(8)),
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
                  DataCell(buildTextButtonAssesment(9)),
                  DataCell(buildTextButtonRemark(9)),
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
                  DataCell(buildTextButtonAssesment(10)),
                  DataCell(buildTextButtonRemark(10)),
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
                  DataCell(buildTextButtonAssesment(11)),
                  DataCell(buildTextButtonRemark(11)),
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
                  DataCell(buildTextButtonAssesment(12)),
                  DataCell(buildTextButtonRemark(12)),
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
                  DataCell(buildTextButtonAssesment(13)),
                  DataCell(buildTextButtonRemark(13)),
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
