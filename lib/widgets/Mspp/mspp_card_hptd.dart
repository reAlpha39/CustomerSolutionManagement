import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/Mspp/mspp_result.dart';
import 'package:customer/widgets/Mspp/mspp_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppCardHptd extends StatelessWidget {
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
                    'Handover parts, tools and documents',
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
          id: 'hptd',
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
          controller.textFieldPI('hptd')[index] =
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
      child: Obx(() => Text(controller.textFieldHPTD[id] == ""
          ? 'Klik disini'
          : "${controller.textFieldHPTD[id]}")),
    );
  }

  TextButton buildTextButtonAssessment(int id) {
    return TextButton(
      onPressed: () {
        resultRadio(index: id);
      },
      child: Obx(() => Text(controller.radioIndexHPTD[id] == -1
          ? 'Pilih disini'
          : '${controller.radioData[controller.radioIndexHPTD[id]]}')),
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
                  DataCell(Text('1.3.5.1')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah setelah selesai pekerjaan service, semua tools dan fasility dibersihkan dan dikembalikan ke tempat semula dan jika ada yang rusak dibuatkan Berita acara kerusakan ?'),
                        ),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('Team PS'),
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
                                  '- Melihat apakah facility PS sudah dibersikan atau belum'),
                              Text(''),
                              Text(
                                  '- Melihat apakah tools sudah dikembalikan ke tempat penyimpanan yang sudah ditentukan'),
                              Text(''),
                              Text(
                                  '- Jika terjadi kerusakan atau kehilangan, melihat apakah dicatat pada form BAK')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Container(
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('- Visual check tools dan facility PS'),
                            Text(''),
                            Text('- Form BAK')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(1)),
                  DataCell(buildTextButtonRemark(1)),
                  DataCell(Text('1.3.5.2')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah semua dokumen Periodik Service yang sudah diisi dilakukan review oleh supervisor / Grup Leader ?'),
                      ),
                    ),
                  ),
                  DataCell(Text('SPV/GL')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Column(
                            children: [
                              Text(
                                  '- Melihat apakah review dan evaluasi pengisian dokumen PS telah dilakukan maksimal 1 hari setelah pekerjaan PS selesai (lengkap, benar dan sudah tanda tangan)'),
                              Text(''),
                              Text(
                                  '- Interview SPV terkait bagaimana proses review dan evaluasi dokumen PS')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('- Job Schedule Sheet'),
                              Text(''),
                              Text('- Backlog Monitoring Sheet'),
                              Text(''),
                              Text('- Check Sheet Service'),
                              Text(''),
                              Text('- Receiving & Final Inspection sheet'),
                              Text(''),
                              Text('- Problem Log Sheet'),
                              Text(''),
                              Text('- Nota Pemakaian Barang')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(2)),
                  DataCell(buildTextButtonRemark(2)),
                  DataCell(Text('1.3.5.3')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah nota pengambilan barang diserahkan ke warehouse setelah pekerjaan selesai untuk konfirmasi pemakaian parts ?'),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('Team PS'),
                  )),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Melihat apakah NPB/SPB telah diserahkan ke warehouse setelah pekerjaan selesai'),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Text('Nota Pemakaian Barang'),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(3)),
                  DataCell(buildTextButtonRemark(3)),
                  DataCell(Text('1.3.5.4.a')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah part yang tidak terpakai di return ke warehouse  ?'),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('Team PS/Warehouse Officer'),
                  )),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Container(
                      width: 160,
                      child: Text(
                          'Melihat apakah spare part yang tidak terpakai sudah dikembalikan ke Warehouse'),
                    ),
                  )),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Text('Dokumen pemakaian part'),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(4)),
                  DataCell(buildTextButtonRemark(4)),
                  DataCell(Text('1.3.5.4.b')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah part yang  sudah terpasang dilakukan good issue ?'),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('Team PS/Warehouse Officer'),
                  )),
                  DataCell(SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Melihat apakah spare parts yang telah terpakai sudah dilakukan good issue di SAP maksimal 1 hari setelah dokumen NPB/SPB diterima oleh PDCSS/WPSR'),
                      ),
                    ),
                  )),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Text('Dokumen pemakaian part'),
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
