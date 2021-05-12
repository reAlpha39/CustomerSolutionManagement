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
            ),
            MsppCard(
              title: 'Assemble people, parts and tools',
              id: 'appt',
              docA: 'mspp',
              colA: 'periodic_service',
              docB: 'assemble_people_parts_and_tools',
            ),
            MsppCard(
              title: 'Ensure proper site setup',
              id: 'epss',
              docA: 'mspp',
              colA: 'periodic_service',
              docB: 'ensure_proper_site_setup',
            ),
            MsppCard(
              title: 'Track PS and Notify progress',
              id: 'tpsnp',
              docA: 'mspp',
              colA: 'periodic_service',
              docB: 'track_ps_and_notify_progress',
            ),
            MsppCard(
              title: 'Handover parts, tools and documents',
              id: 'hptd',
              docA: 'mspp',
              colA: 'periodic_service',
              docB: 'handover_parts_tools_and_documents',
            ),
            MsppCard(
              title: 'Enter Data Into System',
              id: 'eds',
              docA: 'mspp',
              colA: 'periodic_service',
              docB: 'enter_data_into_system',
            ),
            MsppCard(
              title: 'Review performance and lessons learned',
              id: 'rpll',
              docA: 'mspp',
              colA: 'periodic_service',
              docB: 'review_performance_and_lessons_learned',
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
