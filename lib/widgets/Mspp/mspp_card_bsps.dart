import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/Mspp/mspp_result.dart';
import 'package:customer/widgets/Mspp/mspp_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppCardBsps extends StatelessWidget {
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
                    'Balance & Scheduling PS Plan',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                collapsed: Container(),
                expanded: ExpandedBspspData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedBspspData extends StatelessWidget {
  final MsppController controller = Get.find();

  Future<bool> resultRadio({int index}) {
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: 'Pilih salah satu',
        content: (MsppResult(
          data: ['Yes', 'No', 'N/A'],
          index: index,
          id: 'bspsp',
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
          controller.textFieldPI('bspsp')[index] =
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
      child: Obx(() => Text(controller.textFieldBSPSP[id] == ""
          ? 'Klik disini'
          : "${controller.textFieldBSPSP[id]}")),
    );
  }

  TextButton buildTextButtonAssessment(int id) {
    return TextButton(
      onPressed: () {
        resultRadio(index: id);
      },
      child: Obx(() => Text(controller.radioIndexBSPSP[id] == -1
          ? 'Pilih disini'
          : '${controller.radioData[controller.radioIndexBSPSP[id]]}')),
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
                  DataCell(Text('1.2.3.1')),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Container(
                        width: 160,
                        child: Text(
                            'Cek apakah penentuan schedule dan lead time PS sudah mengikuti aturan scheduling dan memperhitungkan projection avaibility ?'),
                      ),
                    ),
                  ),
                  DataCell(Text('Planner')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom:7),
                        child: Container(
                          width: 160,
                          child: Column(
                            children: [
                              Text(
                                  '- Memastikan apakah projection avalibility dibuat dan diupdate setiap bulannya sebelum menentukan leadtime PS'),
                              Text(''),
                              Text(
                                  '- Melihat apakah penentuan lead time PS sudah mempertimbangkan projection availability')
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
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('- File Projection availability'),
                            Text(''),
                            Text('- File Planning PS')
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
                  DataCell(Text('1.2.3.2')),
                  DataCell(
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7, bottom:7),
                        child: Container(
                          width: 160,
                          child: Text(
                              'Cek apakah draft plan service sudah dikirimkan ke pihak Plan, logistic dan operation beberapa hari sebelum pelaksanaan PS untuk memastikan down time unit dan kebutuhan alat support ?'),
                        ),
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
                            'Melihat apakah draft plan PS dikirimkan ke pihak Plant, Logistic dan Operation'),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom:7),
                      child: Text('Email'),
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
