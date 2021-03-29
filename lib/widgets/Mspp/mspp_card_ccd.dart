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
                              DataCell(Text('1.1.1.1.b')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek apakah ada jadwal periodik inspeksi  atas seluruh unit yang dioperasikan ?'),
                                ),
                              ),
                              DataCell(Text('Planner')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Melihat apakah jadwal Periodic Inspection dibuat'),
                                ),
                              ),
                              DataCell(
                                Text('File Planning PI'),
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
                              DataCell(Text('1.1.1.1.b')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek apakah ada jadwal periodik inspeksi  atas seluruh unit yang dioperasikan ?'),
                                ),
                              ),
                              DataCell(Text('Planner')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Melihat apakah jadwal Periodic Inspection dibuat'),
                                ),
                              ),
                              DataCell(
                                Text('File Planning PI'),
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
                              DataCell(Text('1.1.1.1.b')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek apakah ada jadwal periodik inspeksi  atas seluruh unit yang dioperasikan ?'),
                                ),
                              ),
                              DataCell(Text('Planner')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Melihat apakah jadwal Periodic Inspection dibuat'),
                                ),
                              ),
                              DataCell(
                                Text('File Planning PI'),
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
                              DataCell(Text('1.1.1.1.b')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek apakah ada jadwal periodik inspeksi  atas seluruh unit yang dioperasikan ?'),
                                ),
                              ),
                              DataCell(Text('Planner')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Melihat apakah jadwal Periodic Inspection dibuat'),
                                ),
                              ),
                              DataCell(
                                Text('File Planning PI'),
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
                              DataCell(Text('1.1.1.1.b')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek apakah ada jadwal periodik inspeksi  atas seluruh unit yang dioperasikan ?'),
                                ),
                              ),
                              DataCell(Text('Planner')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Melihat apakah jadwal Periodic Inspection dibuat'),
                                ),
                              ),
                              DataCell(
                                Text('File Planning PI'),
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
                              DataCell(Text('1.1.1.1.b')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek apakah ada jadwal periodik inspeksi  atas seluruh unit yang dioperasikan ?'),
                                ),
                              ),
                              DataCell(Text('Planner')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Melihat apakah jadwal Periodic Inspection dibuat'),
                                ),
                              ),
                              DataCell(
                                Text('File Planning PI'),
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
                              DataCell(Text('1.1.1.1.b')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek apakah ada jadwal periodik inspeksi  atas seluruh unit yang dioperasikan ?'),
                                ),
                              ),
                              DataCell(Text('Planner')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Melihat apakah jadwal Periodic Inspection dibuat'),
                                ),
                              ),
                              DataCell(
                                Text('File Planning PI'),
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
                              DataCell(Text('1.1.1.1.b')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek apakah ada jadwal periodik inspeksi  atas seluruh unit yang dioperasikan ?'),
                                ),
                              ),
                              DataCell(Text('Planner')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Melihat apakah jadwal Periodic Inspection dibuat'),
                                ),
                              ),
                              DataCell(
                                Text('File Planning PI'),
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
