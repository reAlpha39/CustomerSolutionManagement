import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppPsPlan extends StatefulWidget {
  @override
  _MsppPsPlanState createState() => _MsppPsPlanState();
}

class _MsppPsPlanState extends State<MsppPsPlan>
    with AutomaticKeepAliveClientMixin {
  MsppController controller = Get.find();
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
              title: 'Compile & Compute Data',
              id: 'ccd',
              docA: 'mspp',
              colA: 'periodic_service_plan',
              docB: 'compile_and_compute_data',
            ),
            MsppCard(
              title: 'Organize & Prioritize PS Plan',
              id: 'oppsp',
              docA: 'mspp',
              colA: 'periodic_service_plan',
              docB: 'organize_and_prioritize_ps_plan',
            ),
            MsppCard(
              title: 'Balance & Scheduling PS Plan',
              id: 'bspsp',
              docA: 'mspp',
              colA: 'periodic_service_plan',
              docB: 'balance_and_scheduling_ps_plan',
            ),
            MsppCard(
              title: 'Resources & Confirm PS Plan',
              id: 'rcpsp',
              docA: 'mspp',
              colA: 'periodic_service_plan',
              docB: 'resources_and_confirm_ps_plan',
            ),
            MsppCard(
              title: 'Adjust Daily for Exception',
              id: 'ade',
              docA: 'mspp',
              colA: 'periodic_service_plan',
              docB: 'adjust_daily_for_exception',
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
