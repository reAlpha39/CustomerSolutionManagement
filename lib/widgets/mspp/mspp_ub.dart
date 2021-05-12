import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppUb extends StatefulWidget {
  const MsppUb({
    Key? key,
  }) : super(key: key);

  @override
  _MsppUbState createState() => _MsppUbState();
}

class _MsppUbState extends State<MsppUb> with AutomaticKeepAliveClientMixin {
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
              title: 'Enter Data in Report',
              id: 'edr',
              docA: 'mspp',
              colA: 'unschedule_breakdown',
              docB: 'enter_data_in_report',
            ),
            MsppCard(
              title: 'Go Ahead and Do The Repair',
              id: 'gar',
              docA: 'mspp',
              colA: 'unschedule_breakdown',
              docB: 'go_ahead_and_do_the_repair',
            ),
            MsppCard(
              title: 'Inspect Unit and Investigate Problem',
              id: 'iuip',
              docA: 'mspp',
              colA: 'unschedule_breakdown',
              docB: 'inspect_unit_and_investigate_problem',
            ),
            MsppCard(
              title: 'Review Job',
              id: 'rj',
              docA: 'mspp',
              colA: 'unschedule_breakdown',
              docB: 'review_job',
            ),
            MsppCard(
              title: 'Talk to the Operator',
              id: 'to',
              docA: 'mspp',
              colA: 'unschedule_breakdown',
              docB: 'talk_to_the_operator',
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
