import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/Mspp/mspp_result.dart';
import 'package:customer/widgets/Mspp/mspp_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppCardTpsnp extends StatelessWidget {
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
                    'Track PS and notify progress',
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
          id: 'tpsnp',
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
          controller.textFieldPI('tpsnp')[index] =
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
      child: Obx(() => Text(controller.textFieldTPSNP[id] == ""
          ? 'Klik disini'
          : "${controller.textFieldTPSNP[id]}")),
    );
  }

  TextButton buildTextButtonAssessment(int id) {
    return TextButton(
      onPressed: () {
        resultRadio(index: id);
      },
      child: Obx(() => Text(controller.radioIndexTPSNP[id] == -1
          ? 'Pilih disini'
          : '${controller.radioData[controller.radioIndexTPSNP[id]]}')),
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
                  DataCell(Text('1.3.4.1')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah setiap pelaksanaan Periodik Service sudah menggunakan check sheet PS dan Job Schedule Sheet ?'),
                    ),
                  ),
                  DataCell(Text('Team PSL')),
                  DataCell(
                    SingleChildScrollView(
                      child: Container(
                        width: 160,
                        child: Column(
                          children: [
                            Text('- Melihat apakah ada JSS untuk setiap PS'),
                            Text(''),
                            Text('- Melihat apakah JSS terisi lengkap'),
                            Text(''),
                            Text(
                                '- Melihat pembagian job dan progress PS dan Backlog apakah sudah sesuai dengan JSS')
                          ],
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Text('Job Schedule Sheet '),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(1)),
                  DataCell(buildTextButtonRemark(1)),
                  DataCell(Text('1.3.4.2')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah sudah ada mekanisme problem log untuk mencatat setiap masalah/ kendala atas pelaksanaan PS dan Backlog?'),
                    ),
                  ),
                  DataCell(Text('Team PS')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Melihat apakah setiap temuan dan masalah pada saat pelaksanaan PS dicatat di Problem Log'),
                    ),
                  ),
                  DataCell(
                    Text('Problem log '),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(2)),
                  DataCell(buildTextButtonRemark(2)),
                  DataCell(Text('1.3.4.3')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah setiap pekerjaan PS  dilakukan final inspection dengan menggunakan form receiving & final inspection ?'),
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
                                '- Melihat apakah setiap PS ada form Receiving and Final Inspection'),
                            Text(''),
                            Text(
                                '- Melihat apakah pengisian form Receiving and Final Inspection sudah benar'),
                            Text(''),
                            Text(
                                '- Inspeksi dan interview mekanik bagaimana mereka mengisi form Receiving and Final Inspection tersebut')
                          ],
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Container(
                        width: 160,
                        child: Text('Form Receiving and Final Inspection')),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(3)),
                  DataCell(buildTextButtonRemark(3)),
                  DataCell(Text('1.3.4.4')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah dokumen Periodik Service (check sheet PS, form Receiving & Final Inspection, form BMS dan JSS) sudah diisi dengan benar ?'),
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
                                '- Melihat apakah semua dokumen PS sudah lengkap atau belum'),
                            Text(''),
                            Text(
                                '- Melihat apakah semua dokumen PS sudah diisi dengan benar dan lengkap pada akhir service'),
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
                            Text('- Job Schedule Sheet                '),
                            Text(''),
                            Text('- Backlog Monitoring Sheet'),
                            Text(''),
                            Text('- Check Sheet Service                 '),
                            Text(''),
                            Text('- Receiving & Final Inspection sheet'),
                            Text(''),
                            Text('- Problem Log Sheet                   '),
                            Text(''),
                            Text('- Nota Pemakaian Barang                ')
                          ],
                        ),
                      ),
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
