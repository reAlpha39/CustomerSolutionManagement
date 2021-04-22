import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:customer/controller/pica_controller.dart';
import 'package:customer/widgets/pica_analysis/pica_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class PicaDetailMenuCard extends StatelessWidget {
  final PicaController picaController = Get.find();
  final PicaCardTableController picaCTController = Get.find();
  final MsppController msppController = Get.find();
  @override
  Widget build(BuildContext context) {
    picaCTController.mappedCard();
    return Card(
      color: Color(0xffffcd29),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 72.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () => picaController.panelController.close(),
                      child: Icon(
                        LineIcons.times,
                        color: Colors.black87,
                      ),
                    ),
                    Obx(
                      () => Text(
                        picaCTController.picaData.value
                            .listPica[picaController.indexDetailData.value][1],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.black26),
                    ),
                    child: Center(
                      child: Text(
                        "0",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
              child: Container(
                height: context.height,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List<Widget>.generate(
                      picaCTController
                          .picaData
                          .value
                          .listPica[picaController.indexDetailData.value][3]
                          .length,
                      (index) => Obx(
                        () => !msppController
                                .radioIndexPI(picaCTController
                                    .picaData
                                    .value
                                    .listPica[
                                        picaController.indexDetailData.value][3]
                                    .elementAt(index)[1])
                                .contains(1)
                            ? Container()
                            : PicaDetailCard(
                                title: picaCTController
                                    .picaData
                                    .value
                                    .listPica[
                                        picaController.indexDetailData.value][3]
                                    .elementAt(index)[0],
                                id: picaCTController
                                    .picaData
                                    .value
                                    .listPica[
                                        picaController.indexDetailData.value][3]
                                    .elementAt(index)[1],
                                indexData: picaController.indexDetailData.value,
                                indexCard: index,
                                tag: picaCTController
                                    .picaData
                                    .value
                                    .listPica[
                                        picaController.indexDetailData.value][3]
                                    .elementAt(index)[1],
                                docA: picaCTController
                                    .picaData
                                    .value
                                    .listPica[
                                        picaController.indexDetailData.value][3]
                                    .elementAt(index)[2][0],
                                colA: picaCTController
                                    .picaData
                                    .value
                                    .listPica[
                                        picaController.indexDetailData.value][3]
                                    .elementAt(index)[2][1],
                                docB: picaCTController
                                    .picaData
                                    .value
                                    .listPica[
                                        picaController.indexDetailData.value][3]
                                    .elementAt(index)[2][2],
                                dataTableFilter: true,
                                dataTableListRadio: msppController.radioIndexPI(
                                    picaCTController
                                        .picaData
                                        .value
                                        .listPica[picaController
                                            .indexDetailData.value][3]
                                        .elementAt(index)[1]),
                                dataTableRadioIndex: 1,
                                radioIndexA: picaCTController.indexResultA,
                                radioIndexB: picaCTController.indexResultB,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
