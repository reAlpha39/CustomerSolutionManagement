import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/Mspp/mspp_result.dart';
import 'package:customer/widgets/Mspp/mspp_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MsppCardAde extends StatelessWidget {
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
                    'Adjust Daily for Exception',
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
                                id: 'ade',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerADE01),
                              ),
                              DataCell(Text('1.2.5.1.a')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek apakah review atas akurasi plan PS vs actual pelaksanaan PS dilakukan secara rutin?'),
                                ),
                              ),
                              DataCell(Text('Planner')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Melihat apakah review Plan dan pelaksanaan PS dilakukan'),
                                ),
                              ),
                              DataCell(
                                Text('MOM meeting Review Pelaksanaan PS'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 1,
                                id: 'ade',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerADE02),
                              ),
                              DataCell(Text('1.2.5.1.b')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek akurasi atas plan PS vs actual apakah tercapai?'),
                                ),
                              ),
                              DataCell(Text('Planner')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Melihat akurasi plan vs actual pelaksanaan PS'),
                                ),
                              ),
                              DataCell(
                                Text('Report pelaksanaan PS'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 2,
                                id: 'ade',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerADE03),
                              ),
                              DataCell(Text('1.2.5.1.c')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek apakah mandatory activity condition based maintenance di review setiap minggu?'),
                                ),
                              ),
                              DataCell(Column(
                                children: [
                                  Text(''),
                                  Text('SPV/GL'),
                                  Text(''),
                                  Text('Planner')
                                ],
                              )),
                              DataCell(
                                SingleChildScrollView(
                                  child: Container(
                                    width: 160,
                                    child: Text(
                                        'Melihat apakah mandatory activity condition based maintenance (contoh : cleaning radiator, pengambilan sample oli, washing unit, dll) dilakukan review tiap minggu'),
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(
                                    'File mandatory activity CBM untuk Periodic Service'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 3,
                                id: 'ade',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerADE04),
                              ),
                              DataCell(Text('1.2.5.2.a')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek apakah plan PS yang tidak tercapai dilakukan reschedule agar akurasi plan PSnya akurat?'),
                                ),
                              ),
                              DataCell(Text('Planner')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Melihat apakah unit yang tidak terlaksana PSnya direschedue atau tidak'),
                                ),
                              ),
                              DataCell(
                                Text('Report pelaksanaan PS'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 4,
                                id: 'ade',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerADE05),
                              ),
                              DataCell(Text('1.2.5.2.b')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek apakah Reschedule PS dikomunikasikan ke operation, logistic dan pihak internal terkait ?'),
                                ),
                              ),
                              DataCell(Text('Planner')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Melihat apakah setiap ada unit yang tidak terlaksana Psnya dikomunikasikan dengan dept terkait'),
                                ),
                              ),
                              DataCell(
                                Text('Email'),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(MsppResult(
                                data: ['Yes', 'No', 'N/A'],
                                index: 5,
                                id: 'ade',
                              )),
                              DataCell(
                                MsppTextField(
                                    controller:
                                        controller.textEditingControllerADE06),
                              ),
                              DataCell(Text('1.2.5.3')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Cek apakah ada koordinasi harian di area Planner untuk membahas persiapan pekerjaan besok dan progress pekerjaan hari ini ?'),
                                ),
                              ),
                              DataCell(Text('Planner')),
                              DataCell(
                                Container(
                                  width: 160,
                                  child: Text(
                                      'Melihat apakah meeting harian konsisten dijalankan, dan apakah meeting record agendanya sesuai'),
                                ),
                              ),
                              DataCell(
                                Text(
                                    'Meeting Record terkait koordinasi dengan Planner'),
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
