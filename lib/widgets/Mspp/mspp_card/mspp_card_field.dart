import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/Mspp/mspp_result.dart';
import 'package:customer/widgets/Mspp/mspp_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppCardField extends StatelessWidget {
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
                    'FIELD',
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
          id: 'field',
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
          controller.textFieldPI('field')[index] =
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
      child: Obx(() => Text(controller.textFieldFIELD[id] == ""
          ? 'Klik disini'
          : "${controller.textFieldFIELD[id]}")),
    );
  }

  TextButton buildTextButtonAssessment(int id) {
    return TextButton(
      onPressed: () {
        resultRadio(index: id);
      },
      child: Obx(() => Text(controller.radioIndexFIELD[id] == -1
          ? 'Pilih disini'
          : '${controller.radioData[controller.radioIndexFIELD[id]]}')),
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
                  DataCell(Text('11B.1.1')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia PIT STOP untuk Pelaksanaan PI sesuai area kerja Customer'),
                        ),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('SPV/GL'),
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
                                  'Periksa ke Lapangan apakah tersedia PIT STOP untuk pelaksanaan PI sesuai dengan Area kerja atau Loading Point Customer ?'),
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
                              Text('Jumlah PIT STOP sesuai Loading Point'),
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
                  DataCell(buildTextButtonAssessment(1)),
                  DataCell(buildTextButtonRemark(1)),
                  DataCell(Text('11B.1.2')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Lube System berikut Oil, Grease, Water Coolant, Battery Electrolit) di setiap PIT STOP untuk kebutuhan TOP UP'),
                        ),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('Kabag Plant'),
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
                                  '- Periksa apakah tersedia Lube system berikut Oil, Grease, Water Coolant, Battery Electrolit di semua PIT STOP dan berfungsi dengan Baik ?'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik PI apakah ada kendala terkait Lube system,  oil dan grease untuk tp up pada saat pelaksanaan PI ?')
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
                              Text('- Problem Log dan Laporan PI'),
                              Text(''),
                              Text('- Observasi lapangan'),
                              Text(''),
                              Text('- Hasil Interview'),
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
                  DataCell(Text('11B.1.3')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Working Bench untuk Pelaksanaan PI, PS, Midlife/OVH dan USC di Lapangan'),
                        ),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('Kabag Plant'),
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
                                  '- Periksa apakah sudah tersedia Working Bench untuk pelaksanaan PI, PS, Midlife/OVH dan USC sesuai dengan Area kerja Customer'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PI, PS, Midlife/OVH dan USC terkait Working Bench')
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
                              Text('- Problem Log dan Laporan PI'),
                              Text(''),
                              Text('- Hasil Interview')
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
                  DataCell(buildTextButtonAssessment(3)),
                  DataCell(buildTextButtonRemark(3)),
                  DataCell(Text('11B.1.4')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Lokasi dan Escort Team sesuai dengan Standard EHS untuk Pelaksanaan PS, Midlife/OVH dan USC (Excavator) di lapangan '),
                        ),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('Kabag Plant'),
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
                                  '- Periksa apakah Lokasi untuk pelaksanaan PI, PS, Midlife/OVH dan USC sudah sesuai dengan Standard EHS dan tersedia Escort Team di lapangan'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik apakah ada kendala saat Pelaksanaan PI, PS, Midlife/OVH dan USC  terkait Lokasi & Escort Team')
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
                              Text('- Field Observasi'),
                              Text(''),
                              Text('- Hasil Interview Mekanik')
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
                  DataCell(Text('11B.1.5')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah terdapat daftar equipment  Field dan statusnya'),
                        ),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('SPV/GL'),
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
                                  'Periksa apakah terdapat Daftar Equipment terupdate'),
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
                              Text('Form Stock Position Tools & Equip.'),
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
                  DataCell(buildTextButtonAssessment(5)),
                  DataCell(buildTextButtonRemark(5)),
                  DataCell(Text('11B.1.6')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Lube Truck untuk  Support PI, PS, Midlife/OVH dan USC) di lapangan'),
                        ),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('Kabag Plant'),
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
                                  '- Periksa apakah sudah tersedia Lube Truck dan Lube System yang berfungsi dengan baik untuk pelaksanaan PI, PS, Midlife/OVH dan USC di lapangan sesuai dengan Area kerja Customer'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PI, PS, Midlife/OVH dan USC terkait Lube Truck dan Lube System')
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
                              Text('- Problem Log dan Laporan PS'),
                              Text(''),
                              Text('- Hasil Interview')
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
                  DataCell(buildTextButtonAssessment(6)),
                  DataCell(buildTextButtonRemark(6)),
                  DataCell(Text('11B.1.7')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Water Truck dan Congkel Man untuk Support PI, PS, Midlife/OVH dan USC (Excavator) di Lapangan'),
                        ),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('Kabag Plant'),
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
                                  '- Periksa apakah sudah tersedia Water Truck dan Congkel Man untuk membersihkan unit yang akan di lakukan pelaksanaan PI, PS, Midlife/OVH dan USC (Excavator) sesuai dengan Area kerja Customer'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PI, PS, Midlife/OVH dan USC (Excavator) terkait Washing dan Cleaning Unit')
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
                              Text('- Problem Log dan Laporan PS'),
                              Text(''),
                              Text('- Hasil Interview')
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
                  DataCell(buildTextButtonAssessment(7)),
                  DataCell(buildTextButtonRemark(7)),
                  DataCell(Text('11B.1.8')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Lifting Equipment/Manitou (Incl. Operator) & Rigger untuk Support PI, PS, Midlife/OVH dan USC di Lapangan'),
                        ),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('Kabag Plant'),
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
                                  '- Periksa apakah sudah tersedia Lifting Equipment/Manitou yang berfungsi dengan baik untuk pelaksanaan PI, PS, Midlife/OVH dan USC sesuai dengan Area kerja Customer'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PI, PS, Midlife/OVH dan USC terkait')
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
                              Text('- Problem Log dan Laporan PS'),
                              Text(''),
                              Text('- Hasil Interview')
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
                  DataCell(buildTextButtonAssessment(8)),
                  DataCell(buildTextButtonRemark(8)),
                  DataCell(Text('11B.1.9')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Crane Truck dan TADANO untuk Support PS, Midlife/OVH dan USC di Lapangan'),
                        ),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('Kabag Plant'),
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
                                  '- Periksa apakah sudah tersedia Crane Truck dan TADANO berfungsi dengan baik untuk pelaksanaan PS, Midlife/OVH dan USC sesuai dengan Area kerja Customer'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PS, Midlife/OVH dan USC terkait Crane Truck dan TADANO')
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
                              Text('- Problem Log dan Laporan PS'),
                              Text(''),
                              Text('- Hasil Interview')
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
                  DataCell(buildTextButtonAssessment(9)),
                  DataCell(buildTextButtonRemark(9)),
                  DataCell(Text('11B.1.10')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Camp / Rest Area untuk Support PI, PS, Midlife/OVH dan USC di Lapangan'),
                        ),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('Kabag Plant'),
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
                                  '- Periksa apakah sudah tersedia Camp / Rest Area berfungsi dengan baik untuk pelaksanaan PI, PS, Midlife/OVH dan USC sesuai dengan Area kerja Customer '),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PI, PS, Midlife/OVH dan USC terkait Camp / Rest Area')
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
                              Text('- Problem Log dan Laporan PS'),
                              Text(''),
                              Text('- Hasil Interview')
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
                  DataCell(buildTextButtonAssessment(10)),
                  DataCell(buildTextButtonRemark(10)),
                  DataCell(Text('11B.1.11')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Wheel Chocker untuk Support PI, PS, Midlife/OVH dan USC di Lapangan'),
                        ),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('Kabag Plant'),
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
                                  '- Periksa apakah sudah tersedia Wheel Chocker untuk pelaksanaan PI, PS, Midlife/OVH dan USC sesuai dengan Area kerja Customer'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PI, PS, Midlife/OVH dan USC terkait Wheel Chocker')
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
                              Text('- Problem Log dan Laporan PS'),
                              Text(''),
                              Text('- Hasil Interview')
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
                  DataCell(buildTextButtonAssessment(11)),
                  DataCell(buildTextButtonRemark(11)),
                  DataCell(Text('11B.1.12')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah setiap operator memiliki Surat Ijin Operasi atau TIO atau KIMPER?'),
                        ),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('Safety Officer'),
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
                                  'Periksa apakah terdapat Form Monitoring SIO, TIO, KIMPER'),
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
                              Text('Monitoring Surat Ijin Operasi equipment'),
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
                  DataCell(buildTextButtonAssessment(12)),
                  DataCell(buildTextButtonRemark(12)),
                  DataCell(Text('11B.1.13')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Consumable Goods (Oli, Grease, Water Coolant, Battery Electrolit) untuk Pelaksanaan PS, Midlife/OVH dan USC di lapangan'),
                        ),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('Kabag Plant'),
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
                                  '- Periksa apakah sudah selalu ada Consumable Goods (Oli, Grease, Water Coolant) untuk pelaksanaan PI, PS, Midlife/OVH dan USC sesuai dengan Unit Model yang ada di kontrak'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PI, PS, Midlife/OVH dan USC terkait ketersediaan Consumable Goods')
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
                              Text('- Problem Log dan Laporan PS'),
                              Text(''),
                              Text('- Hasil Interview')
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
                  DataCell(buildTextButtonAssessment(13)),
                  DataCell(buildTextButtonRemark(13)),
                  DataCell(Text('11B.1.14')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Fasilitas untuk mengelola Limbah B3 dan Sampah berbahaya untuk Pelaksanaan PI, PS, Midlife,/OVH dan USC'),
                        ),
                      ),
                    ),
                  ),
                  DataCell(Padding(
                    padding: const EdgeInsets.only(top: 7, bottom: 7),
                    child: Text('Kabag Plant'),
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
                                  '- Periksa apakah Customer sudah menyediakan dan Mengelola Limbah B3 dan Sampah berbahaya untuk pelaksanaan PI, PS, Midlife/OVH dan USC sesuai dengan Area kerja Customer'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PI, PS, Midlife/OVH dan USC terkait Pengadaan dan Pengelolaan Limbah B3 dan Sampah berbahaya')
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
                              Text('- Problem Log dan Laporan PS'),
                              Text(''),
                              Text('- Hasil Interview')
                            ],
                          ),
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
