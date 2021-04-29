import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppPs extends StatefulWidget {
  @override
  _MsppPsPlanState createState() => _MsppPsPlanState();
}

class _MsppPsPlanState extends State<MsppPs>
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
              title: 'Plan Periodic Service',
              id: 'pps',
              docA: 'mspp',
              colA: 'periodic_service',
              docB: 'plan_periodic_service',
              radioIndex: controller.radioIndexPPS,
              textFieldIndex: controller.textFieldPPS,
            ),
            MsppCard(
              title: 'Assemble people, parts and tools',
              id: 'appt',
              docA: 'mspp',
              colA: 'periodic_service',
              docB: 'assemble_people_parts_and_tools',
              radioIndex: controller.radioIndexAPPT,
              textFieldIndex: controller.textFieldAPPT,
            ),
            MsppCard(
              title: 'Ensure proper site setup',
              id: 'epss',
              docA: 'mspp',
              colA: 'periodic_service',
              docB: 'ensure_proper_site_setup',
              radioIndex: controller.radioIndexEPSS,
              textFieldIndex: controller.textFieldEPSS,
            ),
            MsppCard(
              title: 'Track PS and Notify progress',
              id: 'tpsnp',
              docA: 'mspp',
              colA: 'periodic_service',
              docB: 'track_ps_and_notify_progress',
              radioIndex: controller.radioIndexTPSNP,
              textFieldIndex: controller.textFieldTPSNP,
            ),
            MsppCard(
              title: 'Handover parts, tools and documents',
              id: 'hptd',
              docA: 'mspp',
              colA: 'periodic_service',
              docB: 'handover_parts_tools_and_documents',
              radioIndex: controller.radioIndexHPTD,
              textFieldIndex: controller.textFieldHPTD,
            ),
            MsppCard(
              title: 'Enter Data Into System',
              id: 'eds',
              docA: 'mspp',
              colA: 'periodic_service',
              docB: 'enter_data_into_system',
              radioIndex: controller.radioIndexEDS,
              textFieldIndex: controller.textFieldEDS,
            ),
            MsppCard(
              title: 'Review performance and lessons learned',
              id: 'rpll',
              docA: 'mspp',
              colA: 'periodic_service',
              docB: 'review_performance_and_lessons_learned',
              radioIndex: controller.radioIndexRPLL,
              textFieldIndex: controller.textFieldRPLL,
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
