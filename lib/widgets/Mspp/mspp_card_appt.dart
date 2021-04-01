import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/Mspp/mspp_result.dart';
import 'package:customer/widgets/Mspp/mspp_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppCardAppt extends StatelessWidget {
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
                    'Assemble people, parts and tools',
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
          id: 'appt',
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
          controller.textFieldPI('appt')[index] =
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
      child: Obx(() => Text(controller.textFieldAPPT[id] == ""
          ? 'Klik disini'
          : "${controller.textFieldAPPT[id]}")),
    );
  }

  TextButton buildTextButtonAssessment(int id) {
    return TextButton(
      onPressed: () {
        resultRadio(index: 0);
      },
      child: Obx(() => Text(controller.radioIndexAPPT[id] == -1
          ? 'Pilih disini'
          : '${controller.radioData[controller.radioIndexAPPT[id]]}')),
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
                  DataCell(Text('1.3.2.1.a')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah briefing dilakukan oleh supervisor kepada team eksekusi Periodik Service di setiap awal shift ?'),
                    ),
                  ),
                  DataCell(Text('SPV/GL')),
                  DataCell(
                    SingleChildScrollView(
                      child: Container(
                        width: 160,
                        child: Column(
                          children: [
                            Text(
                                'Interview SPV/GL dan mekanik terkait bagaimana proses briefing '),
                          ],
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: 160,
                      child: Column(
                        children: [
                          Text('- Meeting Record                       '),
                          Text(''),
                          Text('- Hasil Interview SPV/GL dan mekanik terkait briefing pada awal shift')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(1)),
                  DataCell(buildTextButtonRemark(1)),
                  DataCell(Text('1.3.2.1.b')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah materi briefing sesuai dengan agenda ( target job, safety dan 5 S) ?'),
                    ),
                  ),
                  DataCell(Text('SPV/GL')),
                  DataCell(
                    SingleChildScrollView(
                      child: Container(
                        width: 160,
                        child: Column(
                          children: [
                            Text(
                                'Melihat apakah briefing dilakukan sesuai agenda (pembagian area kerja, JSA, critical item, aplikasi 5S, dan penyerahan dokumen PS)')
                          ],
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: 160,
                      child: Column(
                        children: [
                          Text('- Meeting Record                       '),
                          Text(''),
                          Text('- Hasil Interview SPV/GL dan mekanik terkait briefing pada awal shift')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(2)),
                  DataCell(buildTextButtonRemark(2)),
                  DataCell(Text('1.3.2.2')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah tools dan facility sudah tersedia sesuai kebutuhan di setiap area kerja ?'),
                    ),
                  ),
                  DataCell(Text('Team PS')),
                  DataCell(
                    SingleChildScrollView(
                      child: Container(
                        width: 160,
                        child: Column(
                          children: [
                            Text(
                                '- Melihat apakah Tools dan facility yang diperlukan sudah tersedia sesuai dengan zona kerja masing-masing'),
                            Text(''),
                            Text(
                                '- Interview mekanik apakah masih ada kendala terkait tools dan facility')
                          ],
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    SingleChildScrollView(
                      child: Container(
                        width: 160,
                        child: Column(
                          children: [
                            Text(
                                '- Hasil interview mekanik terkait ketersedian dan kelayakan  tools dan facility'),
                            Text(''),
                            Text('- Fisik tools dan facility per area')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(3)),
                  DataCell(buildTextButtonRemark(3)),
                  DataCell(Text('1.3.2.3')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah parts PS dan backlog sudah diprepare sebelum pelaksanaan Periodik Service ?'),
                    ),
                  ),
                  DataCell(Text('Team PS')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Melihat apakah part PS dan Backlog sudah disiapkan sebelum pelaksanaan PS'),
                    ),
                  ),
                  DataCell(
                    Text('List Part PS dan Backlog'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(4)),
                  DataCell(buildTextButtonRemark(4)),
                  DataCell(Text('1.3.2.4')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah dilakukan konfirmasi atas waktu shutdown unit dari operation dan kesiapan service support dari plan ?'),
                    ),
                  ),
                  DataCell(Text('SPV/GL/Radioman')),
                  DataCell(
                    SingleChildScrollView(
                      child: Container(
                          width: 160,
                          child: Text(
                              'Interview SPV/GL dan Radioman terkait bagaimana cara konfirmasi waktu shutdown unit dan kesiapan service support dari customer')),
                    ),
                  ),
                  DataCell(
                    Container(
                        width: 160,
                        child: Text(
                            'Hasil interview radioman untuk proses konfirmasi shut down unit')),
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
