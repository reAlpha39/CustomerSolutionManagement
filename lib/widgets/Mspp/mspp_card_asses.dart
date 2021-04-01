import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/Mspp/mspp_result.dart';
import 'package:customer/widgets/Mspp/mspp_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppCardAsses extends StatelessWidget {
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
                    'Asses',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                collapsed: Container(),
                expanded: ExpandedAssesData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedAssesData extends StatelessWidget {
  final MsppController controller = Get.find();

  Future<bool> resultRadio({int index}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: 'Pilih salah satu',
        content: (MsppResult(
          data: ['Yes', 'No', 'N/A'],
          index: index,
          id: 'asses',
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
          controller.textFieldPI('asses')[index] =
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
      child: Obx(() => Text(controller.textFieldAsses[id] == ""
          ? 'Klik disini'
          : "${controller.textFieldAsses[id]}")),
    );
  }

  TextButton buildTextButtonAssessment(int id) {
    return TextButton(
      onPressed: () {
        resultRadio(index: id);
      },
      child: Obx(() => Text(controller.radioIndexAsses[id] == -1
          ? 'Pilih disini'
          : '${controller.radioData[controller.radioIndexAsses[id]]}')),
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
                  DataCell(Text('1.1.3.1.a')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah pelaksanaan periodik inspeksi sudah memakai check sheet standard, form pencatatan backlog dan kamera?'),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom:7),
                    child: Text('Team PI'),
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
                                  '- Melihat apakah ada Periodic Inspection Sheet'),
                              Text(''),
                              Text(
                                  '- Melihat apakah ada dokumen Backlog Entry Sheet'),
                              Text(''),
                              Text(
                                  '- Melihat apakah ada Backlog Monitoring Sheet'),
                              Text(''),
                              Text(
                                  '- Melihat apakah mekanik membawa Backlog Monitoring Sheet sesuai jumlah unit saat daily inspection'),
                              Text(''),
                              Text(
                                  '- Melihat apakah Tim PI membawa kamera pada saat pelaksanaan PI '),
                              Text(''),
                              Text(
                                  '- Melihat apakah ada folder foto terkait backlog unit')
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
                        width: 166,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('- Periodic Inspection Sheet'),
                            Text(''),
                            Text('- Backlog Entry Sheet'),
                            Text(''),
                            Text('- Backlog Monitoring Sheet'),
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
                  DataCell(Text('1.1.3.1.b')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah check sheet periodik inspeksi diisi dengan lengkap dan benar?'),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom:7),
                    child: Text('Team PI'),
                  )),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Melihat apakah check sheet PI diisi dengan benar dan lengkap'),
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
                            Text('- Check sheet PI yang sudah diisi'),
                            Text(''),
                            Text('- Interview dengan mekanik dan SPV/GL')
                          ],
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
                  DataCell(Text('1.1.3.2')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah ada pencatatan jika terjadi kendala dalam proses pekerjaan periodik inspeksi ?'),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom:7),
                    child: Text('SPV/GL'),
                  )),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Melihat apakah ada pencatatan setiap ada kendala dalam proses pekerjaan PI'),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Text('Form Problem Log'),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(3)),
                  DataCell(buildTextButtonRemark(3)),
                  DataCell(Text('1.1.3.3')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah hasil periodik inspeksi dan backlog dilakukan evaluasi dan validasi oleh GL/SPV ?'),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom:7),
                    child: Text('SPV/GL'),
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
                                  '- Melihat apakah ada dokumen Periodic Inspection Sheet '),
                              Text(''),
                              Text(
                                  '- Memastikan apakah  Evaluasi dan validasi atas dokumen PI dan Backlog Entry Sheet dilakukan maksimal 1 hari setelah pelaksanaan inspection')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Text('Dokumen PI'),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(4)),
                  DataCell(buildTextButtonRemark(4)),
                  DataCell(Text('1.1.3.4')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah Surat Perintah Kerja (WO) dilakukan closing jika pekerjaan sudah selesai ?'),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom:7),
                    child: Text('Planner'),
                  )),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Melihat apakah WO di close setelah pekerjaan selesai'),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Text('Bukti WO sudah di close'),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(5)),
                  DataCell(buildTextButtonRemark(5)),
                  DataCell(Text('1.1.3.5')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah hasil PI dan backlog dilakukan pencatatan kedalam database/monitoring khusus ?'),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom:7),
                    child: Text('Planner'),
                  )),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Melihat apakah hasil PI dan backlog dicatat kedalam database'),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Text('Database PI dan backlog'),
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
