import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/Mspp/mspp_result.dart';
import 'package:customer/widgets/Mspp/mspp_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppCardEpss extends StatelessWidget {
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
                    'Ensure proper site setup',
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
          id: 'epss',
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
          controller.textFieldPI('epss')[index] =
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
      child: Obx(() => Text(controller.textFieldEPSS[id] == ""
          ? 'Klik disini'
          : "${controller.textFieldEPSS[id]}")),
    );
  }

  TextButton buildTextButtonAssessment(int id) {
    return TextButton(
      onPressed: () {
        resultRadio(index: id);
      },
      child: Obx(() => Text(controller.radioIndexEPSS[id] == -1
          ? 'Pilih disini'
          : '${controller.radioData[controller.radioIndexEPSS[id]]}')),
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
                  DataCell(Text('1.3.3.1')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah lokasi yang digunakan untuk pelaksanaan periodik service sudah sesuai standard dan dilengkapi element pendukung?'),
                      ),
                    ),
                  ),
                  DataCell(Text('Team PS')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom:7),
                        child: Container(
                          width: 160,
                          child: Column(
                            children: [
                              Text(
                                  '- Melihat apakah lokasi dan elemen pendukung (tools, facility & sarana) sesuai standar type PS yang akan digunakan'),
                              Text(''),
                              Text(
                                  '- Interview mekanik dan SPV terkait kendala lokasi dan elemen pendukung'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '- Survey fisik lokasi, tools, facility dan sarana terkait pekerjaan PS'),
                            Text(''),
                            Text('- Hasil interview mekanik dan SPV')
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
                  DataCell(Text('1.3.3.2')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah dilakukan briefing pada setiap awal pelaksanaan periodik service untuk memastikan pembagian job, target jobs dan JSA?'),
                      ),
                    ),
                  ),
                  DataCell(Text('Team PS')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom:7),
                        child: Container(
                          width: 160,
                          child: Column(
                            children: [
                              Text(
                                  '- Melihat apakah ada briefing pada sebelum pelaksanaan PS yang dilakukan sesuai dengan agenda'),
                              Text(''),
                              Text(
                                  '- Melihat apakah setiap pekerjaan PS sudah menggunakan JSA'),
                              Text(''),
                              Text(
                                  '- Interview team PS tentang proses briefing dan pemahaman JSA yang sedang dipakai')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom:7),
                        child: Container(
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('- Job Safety Analysis mekanik'),
                              Text(''),
                              Text(
                                  '- Melihat langsung proses briefing / interview SPV dan team PS')
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
                  DataCell(Text('1.3.3.3.a')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah sudah ada standard form Receiving inspection ?'),
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
                            'Melihat apakah form receiving and final inspection digunakan di setiap PS'),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                          width: 160,
                          child: Text('Form Receiving and Final Inspection')),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(3)),
                  DataCell(buildTextButtonRemark(3)),
                  DataCell(Text('1.3.3.3.b')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah Receiving inspection unit dilakukan sebelum pelaksanaan Periodik service  dengan menggunakan form standard ?'),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom:7),
                    child: Text('Team PS'),
                  )),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom:7),
                        child: Container(
                          width: 160,
                          child: Column(
                            children: [
                              Text(
                                  '- Melihat apakah form receiving and final inspection digunakan di setiap PS'),
                              Text(''),
                              Text(
                                  '- Melihat apakah pengisian form receiving and final inspection sudah sesuai aturan'),
                              Text(''),
                              Text(
                                  '- Melihat apakah ada kondisi yang tidak normal dan dicatat di form receiving and final inspection dan form backlog'),
                              Text(''),
                              Text(
                                  '- Melihat apakah ada form backlog yang diisi jika ditemukan backlog baru'),
                              Text(''),
                              Text(
                                  '- Melihat ke lapangan / interview team PS kapan receiving inspection dilakukan')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom:7),
                        child: Container(
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('- Form Receiving and Final Inspection'),
                              Text(''),
                              Text('- Backlog Entry Sheet'),
                              Text(''),
                              Text('- Hasil interview dan pengecekan lapangan')
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
                  DataCell(buildTextButtonAssessment(4)),
                  DataCell(buildTextButtonRemark(4)),
                  DataCell(Text('1.3.3.4.a')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah sudah ada standard form Backlog Entry Sheet ?'),
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
                            'Melihat apakah sudah ada standart form untuk pencatatan backlog (Backlog Entry Sheet)'),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Text('Backlog Entry Sheet'),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(5)),
                  DataCell(buildTextButtonRemark(5)),
                  DataCell(Text('1.3.3.4.b')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah temuan kerusakan saat receiving inspection sudah di catat dalam Backlog entry sheet ?'),
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
                            'Melihat apakah temuan kerusakan saat receiving inspection dicatat dalam Backlog Entry Sheet'),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Text('Backlog Entry Sheet'),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(6)),
                  DataCell(buildTextButtonRemark(6)),
                  DataCell(Text('1.3.3.5')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah parts , tools dan fasilitas pendukung sudah ditempatkan sesuai pembagian zona kerja saat eksekusi PS ?'),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom:7),
                    child: Text('Team PS'),
                  )),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom:7),
                        child: Container(
                          width: 160,
                          child: Column(
                            children: [
                              Text(
                                  'Melihat apakah penempatan parts, tools, dan fasilitas pendukung sudah sesuai dengan pembagian zona area kerja')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Column(
                          children: [
                            Text(
                                'Visual check penempatan tools, facility dan sarana yang diperlukan'),
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
