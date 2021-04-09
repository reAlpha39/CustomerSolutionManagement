import 'package:customer/controller/other_program_controller.dart';
import 'package:customer/widgets/other_program/other_result.dart';
import 'package:customer/widgets/other_program/other_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherCardDo extends StatelessWidget {
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
                    'Development Organization',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                collapsed: Container(),
                expanded: ExpandedDoData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedDoData extends StatelessWidget {
  final OtherProgramController controller = Get.find();

  Future<bool> resultRadio({int index}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: 'Pilih salah satu',
        content: (OtherResult(
          data: ['Yes', 'No', 'N/A'],
          index: index,
          id: 'do',
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
          controller.textFieldOP('do')[index] =
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
      child: Obx(() => Text(controller.textFieldDO[id] == ""
          ? 'Klik disini'
          : "${controller.textFieldDO[id]}")),
    );
  }

  TextButton buildTextButtonAssessment(int id) {
    return TextButton(
      onPressed: () {
        resultRadio(index: id);
      },
      child: Obx(() => Text(controller.radioIndexDO[id] == -1
          ? 'Pilih disini'
          : '${controller.radioData[controller.radioIndexDO[id]]}')),
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
                  DataCell(Text('12.5.1')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah sudah ada struktur organisasi  untuk Learning and Development Department? '),
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
                            Text('Kabag Development'),
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
                                  'Melihat apakah ada struktur organisasi Development Depertement'),
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
                            Text('Struktur organisasi Development departement'),
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
                  DataCell(Text('12.5.2')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah sudah ada tugas dan tanggung jawab untuk setiap personel di Plant Department?  '),
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
                            Text('- Kabag Development'),
                            Text(''),
                            Text('- HRD'),
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
                                  'Melihat apakah sudah ada tugas dan tanggung jawab untuk setiap personel di Development Departement'),
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
                  DataCell(Text('12.5.3')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek  salinan tugas dan tanggung jawab untuk setiap personel di Plant Department'),
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
                            Text('- Kabag Development'),
                            Text(''),
                            Text('- HRD'),
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
                                  'Melihat apakah setiap jabatan atau fungsi memiliki salinan tugas dan tanggung jawab'),
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
                            Text('Hard Copy/salinan tugas dan tanggung jawab'),
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
                  DataCell(Text('12.5.4')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah sudah  ada Kualifikasi jabatan (minimum requirement untuk tiap-tiap jabatan) ? '),
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
                            Text('- Kabag Development'),
                            Text(''),
                            Text('- HRD'),
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
                                  'Melihat apakah sudah ada standart minimum untuk setiap jabatan'),
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
                  DataCell(buildTextButtonAssessment(4)),
                  DataCell(buildTextButtonRemark(4)),
                  DataCell(Text('12.5.5')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek  salinan Kualifikasi jabatan (minimum requirement untuk tiap-tiap jabatan'),
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
                            Text('- Kabag Development'),
                            Text(''),
                            Text('- HRD'),
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
                                  'Melihat apakah ada salinan untuk minimum requirement setiap jabatan'),
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
                                'Hard copy/salinan minimum requirement setiap jabatan'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(5)),
                  DataCell(buildTextButtonRemark(5)),
                  DataCell(Text('12.5.6')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah IDP telah dibuat untuk setiap personel ? '),
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
                            Text('- Kabag Development'),
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
                                  'Melihat apakah IDP telah dibuat oleh setiap personel'),
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
                            Text('IDP setiap jabatan'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(6)),
                  DataCell(buildTextButtonRemark(6)),
                  DataCell(Text('12.5.7')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah IDP telah dilaksanakan sesuai dengan rencana dan hasilnya dievaluasi ?'),
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
                            Text('- Kabag Development'),
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
                                  'Melihat apakah IDP dilaksanakan sesuai rencana dan di evaluasi'),
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
                            Text('Hasil evaluasi IDP'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(7)),
                  DataCell(buildTextButtonRemark(7)),
                  DataCell(Text('12.5.8')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah KPI untuk masing-masing jabatan dan fungsi sudah ditetapkan? '),
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
                            Text('- Kabag Development'),
                            Text(''),
                            Text('- Site Manager'),
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
                                  'Melihat apakah KPI untuk setiap jabatan dan fungsi sudah ditetapkan'),
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
                            Text('KPI semua jabatan dan fungsi'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(8)),
                  DataCell(buildTextButtonRemark(8)),
                  DataCell(Text('12.5.9')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah Dilaksanakan penilaian kompetensi dan performance dilaksanakan setiap 6 bulan, sebagai masukan proses pengembangan individu? '),
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
                            Text('- Kabag Development'),
                            Text(''),
                            Text('- HRD'),
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
                                  'Melihat apakah penilaian kompetensi dilaksanakan setiap 6 bulan'),
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
                            Text('Hasil penilaian kompetensi'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(9)),
                  DataCell(buildTextButtonRemark(9)),
                  DataCell(Text('12.5.10')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek bagaimana cara menghitung  minimum kecukupan manpower di Plant Department ? '),
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
                            Text('Kabag Development'),
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
                                  'Melihat cara perhitungan kecukupan man power'),
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
                            Text('File man power calculator'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(10)),
                  DataCell(buildTextButtonRemark(10)),
                  DataCell(Text('12.5.11')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek  apakah  tools/metode yang digunakan untuk menghitung  minimum kecukupan manpower di Plant Department ?'),
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
                            Text('Kabag Development'),
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
                                  'Interview dengan kabag Development cara/metode perhitungan man power')
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
                                'Interview dengan kabag Development cara/metode perhitungan man power'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(11)),
                  DataCell(buildTextButtonRemark(11)),
                  DataCell(Text('12.5.12')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah perhitungan tersebut sesuai dengan target KPI (durasi pekerjaan), dan Roster (include cuti) ? '),
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
                            Text('Kabag Development'),
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
                                  'Interview dengan kabag Development terkait perhitungan man power apakah sesuai dengan target KPI dan Roster'),
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
                            Text('Hasil interview dengan kabag Development'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(12)),
                  DataCell(buildTextButtonRemark(12)),
                  DataCell(Text('12.5.13')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah personel yang ada memiliki kompetensi sesuai dengan pekerjaan yang dilakukan?'),
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
                            Text('Kabag Development'),
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
                                  'Melihat apakah setiap personel memiliki kompetensi sesuai dengan pekerjaan yang dilakukan'),
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
                            Text('List kompetensi'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(13)),
                  DataCell(buildTextButtonRemark(13)),
                  DataCell(Text('12.5.14')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah personel dalam setiap jabatan dan fungsi sudah mendapatkan pelatihan sesuai dengan pekerjaan yang dilakukan?'),
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
                            Text('- Kabag Development'),
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
                                  'Melihat apakah setiap jabatan mendapatkan pelatihan sesuai dengan pekerjaan yang dilakukan'),
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
                            Text('Jadwal training tahunan'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(14)),
                  DataCell(buildTextButtonRemark(14)),
                  DataCell(Text('12.5.15')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah terdapat  program pelatihan/training safety untuk seluruh personel yang ada?'),
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
                            Text('Kabag Development'),
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
                                  'Melihat apakah ada jadwal training safety untuk seluruh personel'),
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
                            Text('Jadwal training safety tahunan'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(15)),
                  DataCell(buildTextButtonRemark(15)),
                  DataCell(Text('12.5.16')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text('Materi apa yang diberikan?'),
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
                            Text('Kabag Development'),
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
                                  'Melihat apakah ada list materi untuk training'),
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
                            Text('Materi/modul training'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(16)),
                  DataCell(buildTextButtonRemark(16)),
                  DataCell(Text('12.5.17')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia training untuk seluruh department?'),
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
                            Text('- Kabag Development'),
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
                                  'Melihat apakah ada jadwal training untuk semua department'),
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
                            Text('Jadwal training setiap department'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(17)),
                  DataCell(buildTextButtonRemark(17)),
                  DataCell(Text('12.5.18')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text('Cek jadwal training selama setahun?'),
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
                            Text('- Kabag Development'),
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
                                  'Melihat apakah sudah ada jadwal training tahunan'),
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
                            Text('Jadwal training tahunan'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(18)),
                  DataCell(buildTextButtonRemark(18)),
                  DataCell(Text('12.5.19')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah apakah tersedia training untuk Mechanic?'),
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
                            Text('- Kabag Development'),
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
                                  'Melihat apakah sudah ada jadwal training untuk mekanik'),
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
                            Text('Jadwal training tahunan untuk mekanik'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(19)),
                  DataCell(buildTextButtonRemark(19)),
                  DataCell(Text('12.5.20')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text('Materi apa saja yang diberikan?'),
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
                            Text('- Kabag Development'),
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
                                  'Melihat apakah ada list materi/modul training untuk mekanik'),
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
                            Text('Materi/modul training'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(20)),
                  DataCell(buildTextButtonRemark(20)),
                  DataCell(Text('12.5.21')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia training warehouse dan inventory untuk personel Logistic Department? '),
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
                            Text('- Kabag Development'),
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
                                  'Melihat apakah sudah ada jadwal training warehouse & inventory untuk seluruh personel Logistic Dept'),
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
                                'Jadwal trainng tahunan dengan materi inventory & warehousing'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(21)),
                  DataCell(buildTextButtonRemark(21)),
                  DataCell(Text('12.5.22')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text('Materi apa saja yang diberikan?'),
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
                            Text('- Kabag Development'),
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
                                  'Melihat apakah ada list materi/modul training untuk tim Logistic'),
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
                            Text('Materi/modul training'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(22)),
                  DataCell(buildTextButtonRemark(22)),
                  DataCell(Text('12.5.23')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia training aplikasi produk alat berat untuk personel non Mekanik dan Operator?'),
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
                            Text('- Kabag Development'),
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
                                  'Melihat apakah sudah ada jadwal training APAB'),
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
                            Text('Jadwal trainng APAB'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(23)),
                  DataCell(buildTextButtonRemark(23)),
                  DataCell(Text('12.5.24')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text('Materi apa saja yang diberikan?'),
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
                            Text('Kabag Development'),
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
                                  'Melihat apakah ada list materi/modul training APAB untuk tim Operator dan non Mekanik'),
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
                            Text('Materi/modul training APAB'),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(buildTextButtonAssessment(24)),
                  DataCell(buildTextButtonRemark(24)),
                  DataCell(Text('12.5.25')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah terdapat pola penyusunan training berdasarkan DNA dan TNA? '),
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
                            Text('Kabag Development'),
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
                                  'Melihat apakah penyusunan training didasarkan pada DNA dan TNA')
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
                            Text('Interview dengan Kabag Development'),
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
