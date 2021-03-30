import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/Mspp/mspp_result.dart';
import 'package:customer/widgets/Mspp/mspp_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppCardPlanUnit extends StatelessWidget {
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
                    'Plan Unit',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                collapsed: Container(),
                expanded: ExpandedPlanUnitData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedPlanUnitData extends StatelessWidget {
  final MsppController controller = MsppController.to;

  Future<bool> resultRadio({int index}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: 'Pilih salah satu',
        content: (MsppResult(
          data: ['Yes', 'No', 'N/A'],
          index: index,
          id: 'planUnit',
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
          controller.textFieldPI('planUnit')[index] =
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
                    child: Obx(() => Text(controller.radioIndexPU[0] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexPU[0]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 0);
                    },
                    child: Obx(() => Text(controller.textFieldPU[0] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldPU[0]}")),
                  )),
                  DataCell(Text('1.1.1.1.a')),
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
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 1);
                    },
                    child: Obx(() => Text(controller.radioIndexPU[1] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexPU[1]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 1);
                    },
                    child: Obx(() => Text(controller.textFieldPU[1] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldPU[1]}")),
                  )),
                  DataCell(Text('1.1.1.1.b')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah  jadwal periodik inspeksi selalu diupdate berdasarkan pencapaian periodik inspection sebelumnya ?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child:
                          Text('Melihat apakah pencapaian PI selalu di update'),
                    ),
                  ),
                  DataCell(
                    Text('File Planning PI'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 2);
                    },
                    child: Obx(() => Text(controller.radioIndexPU[2] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexPU[2]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 2);
                    },
                    child: Obx(() => Text(controller.textFieldPU[2] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldPU[2]}")),
                  )),
                  DataCell(Text('1.1.1.2')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Cek apakah  hasil periodik inspeksi  dilakukan review di setiap akhir shift?'),
                    ),
                  ),
                  DataCell(Text('SPV/GL')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Melihat apakah hasil PI dilakukan review setiap akhir shift'),
                    ),
                  ),
                  DataCell(
                    Text('Absensi review meeting'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 3);
                    },
                    child: Obx(() => Text(controller.radioIndexPU[3] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexPU[3]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 3);
                    },
                    child: Obx(() => Text(controller.textFieldPU[3] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldPU[3]}")),
                  )),
                  DataCell(Text('1.1.1.3.a')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Check apakah setiap pekerjaan periodik inspection ada dilengkapi dengan Surat Perintah Kerja (WO) ?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Melihat apakah WO dibuat sesuai dengan plan PI'),
                    ),
                  ),
                  DataCell(
                    Text('Dokumen WO untuk PI'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(TextButton(
                    onPressed: () {
                      resultRadio(index: 4);
                    },
                    child: Obx(() => Text(controller.radioIndexPU[4] == -1
                        ? 'Pilih disini'
                        : '${controller.radioData[controller.radioIndexPU[4]]}')),
                  )),
                  DataCell(TextButton(
                    onPressed: () {
                      resultTextField(index: 4);
                    },
                    child: Obx(() => Text(controller.textFieldPU[4] == ""
                        ? 'Klik disini'
                        : "${controller.textFieldPU[4]}")),
                  )),
                  DataCell(Text('1.1.1.3.b')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Check apakah Surat Perintah Kerja (WO) pekerjaan Periodik Inspeksi dibuat sebelum pelaksanaan inspection ?'),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    Container(
                      width: 160,
                      child: Text(
                          'Melihat apakah WO untuk PI dibuat sebelum pelaksanaan'),
                    ),
                  ),
                  DataCell(
                    Text('Tanggal dokumen WO untuk PI'),
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
