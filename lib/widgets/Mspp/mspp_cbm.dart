import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppCbm extends StatefulWidget {
  const MsppCbm({
    Key key,
  }) : super(key: key);

  @override
  _MsppCbmState createState() => _MsppCbmState();
}

class _MsppCbmState extends State<MsppCbm> with AutomaticKeepAliveClientMixin {
  final MsppController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            MsppFillHelper(),
            MsppCard(
              title: 'Analyze and Reccomendation',
              id: 'arcbm',
              docA: 'mspp',
              colA: 'cbm',
              docB: 'analyze_and_reccomendation',
              radioIndex: controller.radioIndexARCBM,
              textFieldIndex: controller.textFieldARCBM,
            ),
            MsppCard(
              title: 'Evaluation',
              id: 'evcbm',
              docA: 'mspp',
              colA: 'cbm',
              docB: 'evaluation',
              radioIndex: controller.radioIndexEVCBM,
              textFieldIndex: controller.textFieldEVCBM,
            ),
            MsppCard(
              title: 'Plan',
              id: 'plcbm',
              docA: 'mspp',
              colA: 'cbm',
              docB: 'plan',
              radioIndex: controller.radioIndexPLCBM,
              textFieldIndex: controller.textFieldPLCBM,
            ),
            MsppCard(
              title: 'Take Action',
              id: 'tacbm',
              docA: 'mspp',
              colA: 'cbm',
              docB: 'take_action',
              radioIndex: controller.radioIndexTACBM,
              textFieldIndex: controller.textFieldTACBM,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
