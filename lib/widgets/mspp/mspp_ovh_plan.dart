import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppOvhPlan extends StatefulWidget {
  const MsppOvhPlan({
    Key key,
  }) : super(key: key);

  @override
  _MsppOvhPlanState createState() => _MsppOvhPlanState();
}

class _MsppOvhPlanState extends State<MsppOvhPlan>
    with AutomaticKeepAliveClientMixin {
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
              title: 'Adjust and Manage Exception',
              id: 'ame',
              docA: 'mspp',
              colA: 'ovh_plan',
              docB: 'adjust_and_manage_exceptions',
              radioIndex: controller.radioIndexAME,
              textFieldIndex: controller.textFieldAME,
            ),
            MsppCard(
              title: 'Balanced and Schedule OVH Plan',
              id: 'bsop',
              docA: 'mspp',
              colA: 'ovh_plan',
              docB: 'balanced_and_schedule_ovh_plan',
              radioIndex: controller.radioIndexBSOP,
              textFieldIndex: controller.textFieldBSOP,
            ),
            MsppCard(
              title: 'Compile and Compute Data',
              id: 'cccd',
              docA: 'mspp',
              colA: 'ovh_plan',
              docB: 'compile_and_compute_data',
              radioIndex: controller.radioIndexCCCD,
              textFieldIndex: controller.textFieldCCCD,
            ),
            MsppCard(
              title: 'Organize and Prioritize OVH Plan',
              id: 'opop',
              docA: 'mspp',
              colA: 'ovh_plan',
              docB: 'organize_and_prioritize_ovh_plan',
              radioIndex: controller.radioIndexOPOP,
              textFieldIndex: controller.textFieldOPOP,
            ),
            MsppCard(
              title: 'Resource and Confirm OVH Plan',
              id: 'rcop',
              docA: 'mspp',
              colA: 'ovh_plan',
              docB: 'resource_and_confirm_ovh_plan',
              radioIndex: controller.radioIndexRCOP,
              textFieldIndex: controller.textFieldRCOP,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
