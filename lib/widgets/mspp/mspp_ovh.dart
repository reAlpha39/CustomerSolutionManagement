import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppOVH extends StatefulWidget {
  const MsppOVH({
    Key? key,
  }) : super(key: key);

  @override
  _MsppOVHState createState() => _MsppOVHState();
}

class _MsppOVHState extends State<MsppOVH> with AutomaticKeepAliveClientMixin {
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
              title: 'Arrange',
              id: 'ar',
              docA: 'mspp',
              colA: 'ovh',
              docB: 'arrange',
            ),
            MsppCard(
              title: 'End Job',
              id: 'ej',
              docA: 'mspp',
              colA: 'ovh',
              docB: 'end_job',
            ),
            MsppCard(
              title: 'Have Problem Solving',
              id: 'hps',
              docA: 'mspp',
              colA: 'ovh',
              docB: 'have_problem_solving',
            ),
            MsppCard(
              title: 'Notify',
              id: 'nt',
              docA: 'mspp',
              colA: 'ovh',
              docB: 'notify',
            ),
            MsppCard(
              title: 'Plan',
              id: 'pl',
              docA: 'mspp',
              colA: 'ovh',
              docB: 'plan',
            ),
            MsppCard(
              title: 'Review',
              id: 're',
              docA: 'mspp',
              colA: 'ovh',
              docB: 'review',
            ),
            MsppCard(
              title: 'Track',
              id: 'tr',
              docA: 'mspp',
              colA: 'ovh',
              docB: 'track',
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
