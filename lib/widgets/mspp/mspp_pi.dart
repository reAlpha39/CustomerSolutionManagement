import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppPi extends StatefulWidget {
  const MsppPi({
    Key? key,
  }) : super(key: key);

  @override
  _MsppPiState createState() => _MsppPiState();
}

class _MsppPiState extends State<MsppPi> with AutomaticKeepAliveClientMixin {
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
              title: 'Plan Unit',
              id: 'planUnit',
              docA: 'mspp',
              colA: 'periodic_inspection',
              docB: 'plan_unit',
            ),
            MsppCard(
              title: 'Meet',
              id: 'meet',
              docA: 'mspp',
              colA: 'periodic_inspection',
              docB: 'meet',
            ),
            MsppCard(
              title: 'Asses',
              id: 'asses',
              docA: 'mspp',
              colA: 'periodic_inspection',
              docB: 'asses',
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
