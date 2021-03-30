import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/Mspp/mspp_result.dart';
import 'package:customer/widgets/Mspp/mspp_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MsppCardRcps extends StatelessWidget {
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
                    'Resources & Confirm PS Plan',
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
                                id: 'rcpsp',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller: controller
                                        .textEditingControllerRCPSP01),
                              ),
                              DataCell(Text('1.2.4.1')),
                              DataCell(
                                SingleChildScrollView(
                                  child: Container(
                                    width: 160,
                                    child: Text(
                                        'Cek apakah sudah ada konfirmasi dari logistic dan operation atas draft plan service yang sudah dikirimkan maksimal 3 hari sebelum PS dilaksanakan ?'),
                                  ),
                                ),
                              ),
                              DataCell(Text('Planner')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Melihat pada tanggal email konfirmasi atau notulen meeting final plan PS'),
                                ),
                              ),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Tanggal email feedback dari logistic dan operation atau notulen meeting terkait plan PS'),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 1,
                                id: 'rcpsp',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller: controller
                                        .textEditingControllerRCPSP02),
                              ),
                              DataCell(Text('1.2.4.2')),
                              DataCell(
                                SingleChildScrollView(
                                  child: Container(
                                    width: 160,
                                    child: Text(
                                        'Cek apakah fix plan service sudah disepakati dan dikirimkan ke operation, logistic dan plant maksimal 2 hari sebelum pelaksanaan PS?'),
                                  ),
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
                                            '- Melihat apakah email plan PS sudah dikirimkan pe PIC terkait H-2 sebelum pelaksanaan PS'),
                                        Text(''),
                                        Text(
                                            '- Interview PIC terkait apakah sudah menerima plan PS tersebut dan kapan menerima plan PS tersebut H-2')
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
                                      Text('- Email terkait pengiriman Plan PS '),
                                      Text(''),
                                      Text('- Hasil interview dengan PIC terkait')
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 2,
                                id: 'rcpsp',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller: controller
                                        .textEditingControllerRCPSP03),
                              ),
                              DataCell(Text('1.2.4.3')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek apakah plan PS mingguan sudah dibuatkan WO dan diorderkan kebutuhan partsnya beberapa hari sebelum pelaksanaan ?'),
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
                                            '- Melihat apakah sudah dibuatkan WO untuk pekerjaan PS sesuai dengan plan'),
                                        Text(''),
                                        Text(
                                            '- Melihat apakah sudah dilakukan pengorderan part untuk pelaksanaan PS')
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  width: 95,
                                  child: Column(
                                    children: [
                                      Text('- Dokumen WO'),
                                      Text(''),
                                      Text('- List part order')
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 3,
                                id: 'rcpsp',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller: controller
                                        .textEditingControllerRCPSP04),
                              ),
                              DataCell(Text('1.2.4.4')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek apakah dokumen PS sudah dipersiapkan maksimal 1 hari sebelum pelaksanaan PS ?'),
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
                                            '- Melihat apakah dokumen PS sudah lengkap dan diserahkan ke SPV 1 hari sebelum pelaksanaan PS'),
                                        Text(''),
                                        Text(
                                            '- Interview PPC dan SPV terkait dokumen untuk pekerjaan PS besok apakah sudah diterima oleh SPV 1 hari sebelumnya')
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  width: 120,
                                  child: Column(
                                    children: [
                                      Text('- Dokumen PS                '),
                                      Text(''),
                                      Text('- Hasil interview dengan PPC')
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 4,
                                id: 'rcpsp',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller: controller
                                        .textEditingControllerRCPSP05),
                              ),
                              DataCell(Text('1.2.4.5')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek apakah Parts PS dan Backlog sudah di prepare di logistic maksimal 1 hari sebelum pelaksanaan PS ?'),
                                ),
                              ),
                              DataCell(Text('Logistic')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Melihat apakah part ps dan backlog sudah sesuai dengan jumlah plan PS dan sudah disiapkan 1 hari sebelum pelaksanaan PS '),
                                ),
                              ),
                              DataCell(
                                Text('Fisik part PS dan Backlog'),
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
