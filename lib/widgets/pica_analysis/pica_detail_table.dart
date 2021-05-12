import 'package:customer/controller/data_table_controller.dart';
import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/controller/pica_analysis_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/pica_analysis/pica_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaDetailTable extends StatelessWidget {
  final MsppController controller = Get.find();
  final DataTableController dtController = Get.find();
  final PicaCardTableController listCardController = Get.find(tag: 'global');
  final List<String> data = ['0', '1', '2', '3', '4', '5'];
  final String? tag;

  PicaDetailTable({Key? key, this.tag}) : super(key: key);

  Future<bool?> resultRadio({int? index, bool? isA}) {
    final PicaCardTableController controllerPU = Get.find(tag: tag);
    final PicaAnalysisController picaAController = Get.find();
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: 'Pilih salah satu',
        content: PicaResult(
          id: controllerPU.id.value,
          index: index,
          isA: isA,
          data: data,
          tag: tag,
        ),
        textConfirm: 'OK',
        buttonColor: Color(0xffffcd29),
        confirmTextColor: Colors.black87,
        onConfirm: () {
          listCardController.counter(
            indexB: controllerPU.indexCard.value,
            indexA: controllerPU.indexData.value,
          );
          Get.back(closeOverlays: false);
          picaAController.changeOpenedIndexData();
        });
  }

  ElevatedButton buildTextButtonRemark(int id) {
    final PicaCardTableController controllerPU = Get.find(tag: tag);
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
      ),
      onPressed: () {
        resultRadio(index: id, isA: false);
      },
      child: Obx(() => Text(
          controllerPU.indexResultB[controllerPU.loadIndex[id]].toString())),
    );
  }

  ElevatedButton buildTextButtonAssessment(int id) {
    final PicaCardTableController controllerPU = Get.find(tag: tag);
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
      ),
      onPressed: () {
        resultRadio(index: id, isA: true);
      },
      child: Obx(() {
        var a = controllerPU.indexResultA[controllerPU.loadIndex[id]];
        return Text(a.toString());
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PicaCardTableController controllerPU = Get.find(tag: tag);
    dtController.loadDataTable(
      docA: controllerPU.docA.value,
      colA: controllerPU.colA.value,
      docB: controllerPU.docB.value,
      filter: controllerPU.dataTableFilter.value,
      listRadio: controllerPU.dataTableListRadio,
      radioIndex: controllerPU.dataTableRadioIndex,
    );
    controllerPU.displayIndex(
        controllerPU.indexCard.value, controllerPU.indexData.value,
        isGlobal: false, tag: tag);
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Obx(
        () => dtController.auditTableData.value!.id == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scrollbar(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dataRowHeight: 100,
                    columns: [
                      DataColumn(label: Text('No. Klausul')),
                      DataColumn(label: Text('Deskripsi')),
                      DataColumn(label: Text('PIC')),
                      DataColumn(label: Text('Guidance')),
                      DataColumn(label: Text('Objective Evidence')),
                      DataColumn(label: Text('Result')),
                    ],
                    rows: List<DataRow>.generate(
                      dtController.auditTableData.value!.id!.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(ScrollConfiguration(
                            behavior: CustomScrollBehavior(),
                            child: SingleChildScrollView(
                              child: Text(
                                  '${dtController.auditTableData.value!.noKlause![index].replaceAll("\\n", "\n")}'),
                            ),
                          )),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Container(
                                width: 160,
                                child: ScrollConfiguration(
                                  behavior: CustomScrollBehavior(),
                                  child: SingleChildScrollView(
                                    child: Text(
                                        '${dtController.auditTableData.value!.description![index].replaceAll("\\n", "\n")}'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: ScrollConfiguration(
                                behavior: CustomScrollBehavior(),
                                child: SingleChildScrollView(
                                  child: Text(
                                      '${dtController.auditTableData.value!.pic![index].replaceAll("\\n", "\n")}'),
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Container(
                                width: 160,
                                child: ScrollConfiguration(
                                  behavior: CustomScrollBehavior(),
                                  child: SingleChildScrollView(
                                    child: Text(
                                        '${dtController.auditTableData.value!.guidance![index].replaceAll("\\n", "\n")}'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: ScrollConfiguration(
                                behavior: CustomScrollBehavior(),
                                child: SingleChildScrollView(
                                  child: Text(
                                      '${dtController.auditTableData.value!.objectiveEvidence![index].replaceAll("\\n", "\n")}'),
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      child: Text(
                                        'Urgensi',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    buildTextButtonAssessment(
                                      index,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      child: Text(
                                        'Dampak',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    buildTextButtonRemark(
                                      index,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
