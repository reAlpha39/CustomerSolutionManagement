import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:customer/widgets/pica_analysis/pica_detail_table.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaDetailCard extends StatelessWidget {
  final String title;
  final String id;
  final int indexData;
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

  PicaDetailCard({
    Key key,
    this.title,
    this.id,
    this.indexData,
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
    final PicaCardTableController globalController = Get.find(tag: 'global');
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: Card(
        elevation: 4,
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
                                child: Text(
                              globalController
                                  .picaData
                                  .value
                                  .picaElement[indexData]
                                  .picaDetail[indexCard]
                                  .result
                                  .toString(),
                              style: TextStyle(
                                color: Color(0xff665210),
                              ),
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffffcd29),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '$title',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                collapsed: Container(),
                expanded: PicaDetailTable(
                  id: id,
                  tag: tag,
                  indexData: indexData,
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

