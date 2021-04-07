import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/Mspp/mspp_result.dart';
import 'package:customer/widgets/Mspp/mspp_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppCardWorkshop extends StatelessWidget {
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
                    'WORKSHOP',
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
          id: 'workshop',
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
          controller.textFieldPI('workshop')[index] =
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
      child: Obx(() => Text(controller.textFieldWORKSHOP[id] == ""
          ? 'Klik disini'
          : "${controller.textFieldWORKSHOP[id]}")),
    );
  }

  TextButton buildTextButtonAssessment(int id) {
    return TextButton(
      onPressed: () {
        resultRadio(index: id);
      },
      child: Obx(() => Text(controller.radioIndexWORKSHOP[id] == -1
          ? 'Pilih disini'
          : '${controller.radioData[controller.radioIndexWORKSHOP[id]]}')),
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
                  DataCell(Text('11B.2.1')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text('Cek apakah tersedia Layout Workshop'),
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
                                  '- Periksa apakah layout workshop telah tersedia lengkap dengan nama dan lokasi setiap ruangan di workshop'),
                              Text(''),
                              Text(
                                  '- Periksa apakah layout workshop sudah terpasang di dinding workshop')
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
                              Text('- Layout Workshop tercetak'),
                              Text(''),
                              Text('- Layout workshop tertempel')
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
                  DataCell(Text('11B.2.2')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah sudah ada Demarkasi (rambu warna) di area kerja (Workshop)Cek apakah tersedia PIT STOP untuk Pelaksanaan PI sesuai area kerja Customer'),
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
                              Text('- Periksa apakah ada standar demarkasi'),
                              Text(''),
                              Text(
                                  '- Periksa apakah demarkasi area workshop telah sesuai dengan standart'),
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
                              Text('Observasi Lapangan'),
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
                  DataCell(Text('11B.2.3')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah Jumlah BAYS mencukupi untuk Pelaksanaan PS, Midlife/OVH dan USC di Workshop dan Escort Team sesuai dengan Standard EHS'),
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
                                  '- Periksa apakah Jumlah BAYS untuk pelaksanaan PS, Midlife/OVH dan USC mencukupi dan sudah sesuai dengan Standard EHS dan tersedia Escort Team'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik apakah ada kendala BAYS saat Pelaksanaan PS, Midlife/OVH dan USC'),
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
                  DataCell(buildTextButtonAssessment(3)),
                  DataCell(buildTextButtonRemark(3)),
                  DataCell(Text('11B.2.4')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah terdapat daftar equipment Workshop dan statusnya'),
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
                                  'Periksa apakah terdapat daftar equipment terupdate'),
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
                              Text('Form Stock Position Tools & Equipment'),
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
                  DataCell(Text('11B.2.5')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Lube System untuk Support PS, Midlife/OVH dan USC di Workshop'),
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
                                  '- Periksa apakah sudah tersedia Lube Truck dan Lube System yang berfungsi dengan baik untuk pelaksanaan PS, Midlife/OVH dan USC di Workshop'),
                              Text(''),
                              Text(
                                  'Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PS, Midlife/OVH dan USC terkait Lube Truck dan Lube System'),
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
                  DataCell(buildTextButtonAssessment(5)),
                  DataCell(buildTextButtonRemark(5)),
                  DataCell(Text('11B.2.6')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Washing Pad berikut Manpower nya untuk membersihkan unit yang akan di lakukan PS, Midlife/OVH dan USC di Workshop'),
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
                                  '- Periksa apakah sudah tersedia Washing Pad berikut Manpower nya untuk membersihkan unit yang akan di lakukan pelaksanaan PS, Midlife/OVH dan USC'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PS, Midlife/OVH dan USC terkait Washing dan Cleaning Unit'),
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
                  DataCell(buildTextButtonAssessment(6)),
                  DataCell(buildTextButtonRemark(6)),
                  DataCell(Text('11B.2.7')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Overhead Crane untuk Support PS, Midlife/OVH dan USC di Workshop'),
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
                                  '- Periksa apakah sudah tersedia Overhead Crane Truck dan berfungsi dengan baik untuk pelaksanaan PS, Midlife/OVH dan USC'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PS, Midlife/OVH dan USC terkait Overhead Crane'),
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
                  DataCell(buildTextButtonAssessment(7)),
                  DataCell(buildTextButtonRemark(7)),
                  DataCell(Text('11B.2.8')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Crane Truck untuk Support PS, Midlife/OVH dan USC di Workshop'),
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
                                  '- Periksa apakah sudah tersedia Crane Truck yang berfungsi dengan baik untuk pelaksanaan PS, Midlife/OVH dan USC'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PS, Midlife/OVH dan USC terkait Crane Truck'),
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
                  DataCell(buildTextButtonAssessment(8)),
                  DataCell(buildTextButtonRemark(8)),
                  DataCell(Text('11B.2.9')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia FORKLIFT (Incl. Operator) & Rigger untuk Support PS, Midlife/OVH dan USC di Workshop'),
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
                                  '- Periksa apakah sudah tersedia FORKLIFT (Incl. Operator) & Rigger yang berfungsi dengan baik untuk pelaksanaan PS, Midlife/OVH dan USC'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PS, Midlife/OVH dan USC terkait FORKLIFT (Incl. Operator) & Rigger'),
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
                  DataCell(buildTextButtonAssessment(9)),
                  DataCell(buildTextButtonRemark(9)),
                  DataCell(Text('11B.2.10')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Hydrolik Jack sesuai Model Unit untuk Support PS, Midlife/OVH dan USC di Workshop'),
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
                                  '- Periksa apakah sudah tersedia Hydrolik Jack 200 T yang berfungsi dengan baik untuk pelaksanaan PS, Midlife/OVH dan USC'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PS, Midlife/OVH dan USC terkait Hydrolik Jack 200 T'),
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
                  DataCell(buildTextButtonAssessment(10)),
                  DataCell(buildTextButtonRemark(10)),
                  DataCell(Text('11B.2.11')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Hyt ORC & Pump Assy untuk Support PS, Midlife/OVH dan USC di Workshop'),
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
                                  '- Periksa apakah sudah tersedia Hyt ORC & Pump Assy yang berfungsi dengan baik untuk pelaksanaan PS, Midlife/OVH dan USC'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PS, Midlife/OVH dan USC terkait Hyt ORC & Pump Assy'),
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
                  DataCell(buildTextButtonAssessment(11)),
                  DataCell(buildTextButtonRemark(11)),
                  DataCell(Text('11B.2.12')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Steam Cleaner untuk Support PS, Midlife/OVH dan USC di Workshop'),
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
                                  '- Periksa apakah sudah tersedia Steam Cleaner yang berfungsi dengan baik untuk pelaksanaan PS, Midlife/OVH dan USC'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PS, Midlife/OVH dan USC terkait Steam Cleaner'),
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
                              Text(
                                  'Observasi lapangan atas Jumlah PIT STOP sesuai Loading Point'),
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
                  DataCell(Text('11B.2.13')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Utilities & Services (Stand Unit & Component, Ladder, Keranjang Component, Meja Kerja, Lemari, Oil Waste Container, Seabeam, dll) untuk Support PS, Midlife/OVH dan USC'),
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
                                  '- Periksa apakah sudah tersedia Utilities & Services (Stand Unit & Component, Ladder, Keranjang Component, Meja Kerja, Lemari, Oil Waste Container, Seabeam, dll) berfungsi dengan baik untuk pelaksanaan PS, Midlife/OVH dan USC'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PS, Midlife/OVH dan USC terkait Utilities & Services (Stand Unit & Component, Ladder, Keranjang Component, Meja Kerja, Lemari, Oil Waste Container, Seabeam, dll)'),
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
                              Text('Form Stock Position Tools & Equipment'),
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
                  DataCell(Text('11B.2.14')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Camp / Rest Area untuk Support PS, Midlife/OVH dan USC di Workshop'),
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
                                  '- Periksa apakah sudah tersedia Camp / Rest Area berfungsi dengan baik untuk pelaksanaan PS, Midlife/OVH dan USC'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PS, Midlife/OVH dan USC terkait Camp / Rest Area'),
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
                              Text('Instruksi Kerja di setiap equipment'),
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
                  DataCell(buildTextButtonAssessment(14)),
                  DataCell(buildTextButtonRemark(14)),
                  DataCell(Text('11B.2.15')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Wheel Chocker untuk Support PS, Midlife/OVH dan USC di Workshop'),
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
                                  '- Periksa apakah sudah tersedia Wheel Chocker untuk pelaksanaan PS, Midlife/OVH dan USC'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PS, Midlife/OVH dan USC terkait Wheel Chocker'),
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
                              Text('Jadwal Maintenance Equipment'),
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
                  DataCell(buildTextButtonAssessment(15)),
                  DataCell(buildTextButtonRemark(15)),
                  DataCell(Text('11B.2.16')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Welding Machine termasuk Welder untuk Support Pekerjaan Fabrikasi yang di lakukan bersamaan dengan Pelaksanaan PI, PS, Midlife/OVH dan USC di Lapangan'),
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
                                  '- Periksa apakah sudah tersedia Welder Machine termasuk Welder untuk Support Pekerjaan Fabrikasi yang di lakukan bersamaan dengan saat pelaksanaan PI, PS, Midlife/OVH dan USC sesuai dengan Area kerja Customer'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala terkait Welder Machine termasuk Welder nya saat Pelaksanaan Fabrikasi yang di lakukan bersamaan dengan Pelaksanaan PI, PS, Midlife/OVH dan USC '),
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
                              Text(
                                  'Jadwal Maintenance Equipment, yang sudah diisi aktual pelaksanaan maintenance equipment nya'),
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
                  DataCell(buildTextButtonAssessment(16)),
                  DataCell(buildTextButtonRemark(16)),
                  DataCell(Text('11B.2.17')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia jadwal perawatan Equipment Workshop'),
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
                                  'Periksa apakah pelaksanaan perawatannya dilakukan secara mingguan'),
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
                  DataCell(buildTextButtonAssessment(17)),
                  DataCell(buildTextButtonRemark(17)),
                  DataCell(Text('11B.2.18')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah setiap equipment facilities telah dilengkapi dengan Instruksi Kerja'),
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
                                  'Periksa apakah setiap equipment facilities telah dilengkapi dengan Instruksi Kerja'),
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
                              Text('Form Laporan Perawatan Workshop'),
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
                  DataCell(buildTextButtonAssessment(18)),
                  DataCell(buildTextButtonRemark(18)),
                  DataCell(Text('11B.2.19')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah terdapat jadwal perawatan (Maintenance) secara berkala dan report pelaksanaan'),
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
                                  'Periksa apakah equipment facilities telah dilengkapi dengan jadwal perawatan berkala'),
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
                              Text('Form Laporan Perawatan Workshop'),
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
                  DataCell(buildTextButtonAssessment(19)),
                  DataCell(buildTextButtonRemark(19)),
                  DataCell(Text('11B.2.20')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah pelaksanaan perawatan dilakukan sesuai dengan jadwal'),
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
                                  'Periksa apakah pelaksanaan perawatan berkala equipment facilities dilakukan sesuai dengan jadwal perawatan berkala'),
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
                              Text('- Hasil Interview Mekanik'),
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
                  DataCell(buildTextButtonAssessment(20)),
                  DataCell(buildTextButtonRemark(20)),
                  DataCell(Text('11B.2.21')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah setiap equipment yang rusak dilakukan tagging'),
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
                              Text('- Periksa ketersediaan Tagging'),
                              Text(''),
                              Text(
                                  '- Periksa actual di lapangan apakah Tagging terpasang di equipment yang rusak'),
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
                  DataCell(buildTextButtonAssessment(21)),
                  DataCell(buildTextButtonRemark(21)),
                  DataCell(Text('11B.2.22')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah setiap kerusakan dan kehilangan equipment sudah dibuatkan Form BAKK (Berita Acara Kerusakan/Kehilangan)'),
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
                              Text('- Periksa apakah semua equipment yang rusak telah dibuatkan form BAKK-nya'),
                              Text(''),
                              Text(
                                  '- Periksa apakah semua form BAKK sudah diupdate dimonitoring BAKK'),
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
                  DataCell(buildTextButtonAssessment(22)),
                  DataCell(buildTextButtonRemark(22)),
                  DataCell(Text('11B.2.23')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah terdapat sertifikat equipment yang masih berlaku'),
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
                                  'Periksa apakah Setiap operator equipment harus mempunyai Surat Izin Operasi atau TIO atau KIMPER yang masih berlaku dan ada form monitoringnya'),
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
                  DataCell(buildTextButtonAssessment(23)),
                  DataCell(buildTextButtonRemark(23)),
                  DataCell(Text('11B.2.24')),
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
                              Text('- Problem Log dan Laporan PS'),
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
                  DataCell(buildTextButtonAssessment(24)),
                  DataCell(buildTextButtonRemark(24)),
                  DataCell(Text('11B.2.25')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Consumable Goods (Oli, Grease, Water Coolant, Battery Electrolit, Electroda, Nitrogen, Oksigen) untuk Pelaksanaan PS, Midlife/OVH dan USC di Workshop'),
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
                              Text('- Periksa apakah sudah selalu ada Consumable Goods (Oli, Grease, Water Coolant, Battery Electrolit) untuk pelaksanaan PS, Midlife/OVH dan USC sesuai dengan Unit Model yang ada di kontrak'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PS, Midlife/OVH dan USC terkait ketersediaan Consumable Goods'),
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
                              Text('Tagging yang telah diisi lengkap'),
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
                  DataCell(buildTextButtonAssessment(25)),
                  DataCell(buildTextButtonRemark(25)),
                  DataCell(Text('11B.2.26')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah tersedia Fasilitas untuk mengelola Limbah B3, Sampah berbahaya dari Pelaksanaan PS, Midlife,/OVH dan USC di Workshop'),
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
                                  '- Periksa apakah Customer sudah menyediakan dan Mengelola Limbah B3 dan Sampah berbahaya untuk pelaksanaan PS, Midlife/OVH dan USC'),
                              Text(''),
                              Text(
                                  '- Interview Mekanik UT & PIC Customer atas kendala saat Pelaksanaan PS, Midlife/OVH dan USC terkait Pengadaan dan Pengelolaan Limbah B3 dan Sampah berbahaya'),
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
                              Text('Form BAKK'),
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
