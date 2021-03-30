import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/Mspp/mspp_result.dart';
import 'package:customer/widgets/Mspp/mspp_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MsppCardCcd extends StatelessWidget {
  final MsppController controller = MsppController.to;

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
                expanded: Padding(
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
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 0,
                                id: 'ccd',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerCCD01),
                              ),
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
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 0,
                                id: 'ccd',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerCCD01),
                              ),
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
                                        Text(
                                            '- Melihat apakah ada target waktu eksekusi')
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
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 0,
                                id: 'ccd',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerCCD01),
                              ),
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
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 0,
                                id: 'ccd',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerCCD01),
                              ),
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
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 0,
                                id: 'ccd',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerCCD01),
                              ),
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
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 0,
                                id: 'ccd',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerCCD01),
                              ),
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
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 0,
                                id: 'ccd',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerCCD01),
                              ),
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
                                  child:
                                      Text('Melihat file backlog monitoring'),
                                ),
                              ),
                              DataCell(
                                Text('File Planning PS'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 1,
                                id: 'ccd',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerCCD02),
                              ),
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
                                  child:
                                      Text('Melihat file backlog monitoring'),
                                ),
                              ),
                              DataCell(
                                Text('File Planning PS'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 2,
                                id: 'ccd',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerCCD03),
                              ),
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
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 3,
                                id: 'ccd',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerCCD04),
                              ),
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
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 4,
                                id: 'ccd',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerCCD05),
                              ),
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
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 5,
                                id: 'ccd',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerCCD06),
                              ),
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
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 6,
                                id: 'ccd',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerCCD07),
                              ),
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
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 7,
                                id: 'ccd',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerCCD08),
                              ),
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
                                  child:
                                      Text('Melihat Backlog Monitoring Sheet'),
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
