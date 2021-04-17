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
    return Container(
      height: context.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            PicaObservationCard(
              title: 'Plan Unit',
              id: 'planUnit',
              tag: 'planUnit',
              docA: 'mspp',
              colA: 'periodic_inspection',
              docB: 'plan_unit',
              dataTableFilter: true,
              dataTableListRadio: msppController.radioIndexPU,
              dataTableRadioIndex: 1,
              radioIndexA: controller.indexResultA,
              radioIndexB: controller.indexResultB,
            ),
            PicaObservationCard(
              title: 'Meet',
              id: 'meet',
              tag: 'meet',
              docA: 'mspp',
              colA: 'periodic_inspection',
              docB: 'meet',
              dataTableFilter: true,
              dataTableListRadio: msppController.radioIndexMeet,
              dataTableRadioIndex: 1,
              radioIndexA: controller.indexResultA,
              radioIndexB: controller.indexResultB,
            ),
            PicaObservationCard(
              title: 'Asses',
              id: 'asses',
              tag: 'asses',
              docA: 'mspp',
              colA: 'periodic_inspection',
              docB: 'asses',
              dataTableFilter: true,
              dataTableListRadio: msppController.radioIndexAsses,
              dataTableRadioIndex: 1,
              radioIndexA: controller.indexResultA,
              radioIndexB: controller.indexResultB,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
