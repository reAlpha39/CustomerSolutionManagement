import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:customer/widgets/pica_analysis/pica_observation_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaObservation extends StatefulWidget {
  @override
  _PicaObservationState createState() => _PicaObservationState();
}

class _PicaObservationState extends State<PicaObservation>
    with AutomaticKeepAliveClientMixin {
  final PicaCardTableController controller = Get.find();
  final MsppController msppController = Get.find();
  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    super.build(context);
    controller.listedCard();
    return Container(
      height: context.height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: List<Widget>.generate(
            controller.listCard.length,
            (index) => Obx(
              () => !msppController
                      .radioIndexPI(controller.listCard.elementAt(index)[1])
                      .contains(1)
                  ? Container()
                  : PicaObservationCard(
                      title: '${controller.listCard.elementAt(index)[0]}',
                      id: '${controller.listCard.elementAt(index)[1]}',
                      indexCard: index,
                      tag: '${controller.listCard.elementAt(index)[1]}',
                      docA: '${controller.listCard.elementAt(index)[2][0]}',
                      colA: '${controller.listCard.elementAt(index)[2][1]}',
                      docB: '${controller.listCard.elementAt(index)[2][2]}',
                      dataTableFilter: true,
                      dataTableListRadio: msppController.radioIndexPI(
                          controller.listCard.elementAt(index)[1]),
                      dataTableRadioIndex: 1,
                      radioIndexA: controller.indexResultA,
                      radioIndexB: controller.indexResultB,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
