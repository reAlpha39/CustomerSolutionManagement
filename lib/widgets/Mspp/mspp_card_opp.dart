import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/Mspp/mspp_result.dart';
import 'package:customer/widgets/Mspp/mspp_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppCardOpp extends StatelessWidget {
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
                    'Organize & Prioritize PS Plan',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                collapsed: Container(),
                expanded: ExpandedOppspData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedOppspData extends StatelessWidget {
  final MsppController controller = MsppController.to;

  Future<bool> resultRadio({int index}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: 'Pilih salah satu',
        content: (MsppResult(
          data: ['Yes', 'No', 'N/A'],
          index: index,
          id: 'oppsp',
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
          controller.textFieldPI('oppsp')[index] =
              controller.textEditingControllerALL.text;
          controller.textEditingControllerALL.clear();
          Get.back(closeOverlays: false);
        });
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
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 0);
                    },
                    child: Obx(() => Text(controller.radioIndexOPPSP[0] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexOPPSP[0]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 0);
                    },
                    child: Obx(() => Text(controller.textFieldOPPSP[0] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldOPPSP[0]}")),
                  )),
                  DataCell(Text('1.2.2.1')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah verifikasi atas status backlog dilakukan untuk persiapan meeting plan service ?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Melihat apakah status backlog dan status part sudah update pada backlog monitoring sheet'),
                    ),
                  ),
                  DataCell(
                    Text('File Backlog Monitoring'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 1);
                    },
                    child: Obx(() => Text(controller.radioIndexOPPSP[1] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexOPPSP[1]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 1);
                    },
                    child: Obx(() => Text(controller.textFieldOPPSP[1] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldOPPSP[1]}")),
                  )),
                  DataCell(Text('1.2.2.2')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah meeting mingguan dilakukan dengan konsisten?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text('Melihat CoE dan MOM meeting mingguan'),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: 130,
                      child: Column(
                        children: [
                          Text('- CoE                           '),
                          Text(''),
                          Text('- Minutes of Meeting')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 2);
                    },
                    child: Obx(() => Text(controller.radioIndexOPPSP[2] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexOPPSP[2]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 2);
                    },
                    child: Obx(() => Text(controller.textFieldOPPSP[2] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldOPPSP[2]}")),
                  )),
                  DataCell(Text('1.2.2.3')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah urutan prioritas plan PS sudah di tetapkan sesuai data Condition Base Monitoring ?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Melihat apakah urutan plan PS sudah sesuai dengan data Condition Based Maintenance'),
                    ),
                  ),
                  DataCell(
                    Text('File Planning PS'),
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
