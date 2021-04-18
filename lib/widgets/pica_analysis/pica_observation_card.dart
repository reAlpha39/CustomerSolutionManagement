import 'package:customer/controller/data_table_controller.dart';
import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:customer/widgets/pica_analysis/pica_result.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaObservationCard extends StatelessWidget {
  final String title;
  final String id;
  final int indexCard;
  final String tag;
  final String docA;
  final String docB;
  final String colA;
  final List<int> radioIndexA;
  final List<int> radioIndexB;
  final bool dataTableFilter;
  final RxList<int> dataTableListRadio;
  final int dataTableRadioIndex;

  PicaObservationCard({
    Key key,
    this.title,
    this.id,
    this.indexCard,
    this.docA,
    this.docB,
    this.colA,
    this.radioIndexA,
    this.radioIndexB,
    this.dataTableFilter = false,
    this.dataTableListRadio,
    this.dataTableRadioIndex,
    this.tag,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PicaCardTableController controller = Get.find(tag: tag);
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: ExpandableNotifier(
            controller: controller.expandableController,
            child: ScrollOnExpand(
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: false,
                  hasIcon: true,
                ),
                header: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Obx(
                            () => Center(
                                child: Text('${controller.total.value}')),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffffcd29),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Text(
                        '$title',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                collapsed: Container(),
                expanded: MsppDataTable(
                  id: id,
                  tag: tag,
                  indexCard: indexCard,
                  docA: docA,
                  colA: colA,
                  docB: docB,
                  radioIndexB: radioIndexB,
                  radioIndexA: radioIndexA,
                  dataTableFilter: dataTableFilter,
                  dataTableListRadio: dataTableListRadio,
                  dataTableRadioIndex: dataTableRadioIndex,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MsppDataTable extends StatelessWidget {
  final MsppController controller = Get.find();
  final DataTableController dtController = Get.find();
  final List<int> radioIndexA;
  final List<int> radioIndexB;
  final String id;
  final String tag;
  final int indexCard;
  final String docA;
  final String docB;
  final String colA;
  final bool dataTableFilter;
  final RxList<int> dataTableListRadio;
  final int dataTableRadioIndex;
  final List<String> data = ['0', '1', '2', '3', '4', '5'];

  MsppDataTable({
    Key key,
    this.radioIndexA,
    this.radioIndexB,
    this.docA,
    this.docB,
    this.colA,
    this.dataTableFilter,
    this.id,
    this.indexCard,
    this.dataTableListRadio,
    this.dataTableRadioIndex,
    this.tag,
  }) : super(key: key);

  Future<bool> resultRadio({int index, bool isA}) {
    final PicaCardTableController controllerPU = Get.find(tag: tag);
    final PicaCardTableController listCardController = Get.find();
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: 'Pilih salah satu',
        content: PicaResult(
          id: id,
          index: index,
          isA: isA,
          data: data,
          tag: tag,
        ),
        textConfirm: 'OK',
        buttonColor: Color(0xffffcd29),
        confirmTextColor: Colors.black87,
        onConfirm: () {
          controllerPU.counter(
            indexA: controllerPU.indexResultA[index],
            indexB: controllerPU.indexResultB[index],
            totalRow: dtController.auditTableData.value.id.length,
            row: index,
          );
          listCardController.sortCard(indexCard, controllerPU.total.value);
          Get.back(closeOverlays: false);
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
      child: Obx(() => Text('${controllerPU.indexResultB[id]}')),
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
      child: Obx(() => Text('${controllerPU.indexResultA[id]}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    dtController.loadDataTable(
      docA: '$docA',
      colA: '$colA',
      docB: '$docB',
      filter: dataTableFilter,
      listRadio: dataTableListRadio,
      radioIndex: dataTableRadioIndex,
    );
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Obx(
        () => dtController.auditTableData.value.id == null
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
                      dtController.auditTableData.value.id.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text(
                              '${dtController.auditTableData.value.noKlause[index]}')),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Container(
                                width: 160,
                                child: Text(
                                    '${dtController.auditTableData.value.description[index]}'),
                              ),
                            ),
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Text(
                                  '${dtController.auditTableData.value.pic[index]}'),
                            ),
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Container(
                                width: 160,
                                child: Text(
                                    '${dtController.auditTableData.value.guidance[index]}'),
                              ),
                            ),
                          ),
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Text(
                                  '${dtController.auditTableData.value.objectiveEvidence[index]}'),
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
                                        'A',
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
                                        'B',
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
