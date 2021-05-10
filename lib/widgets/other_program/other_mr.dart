import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherMr extends StatefulWidget {
  @override
  _OtherMrState createState() => _OtherMrState();
}

class _OtherMrState extends State<OtherMr> with AutomaticKeepAliveClientMixin {
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
              title: 'Plant Department',
              id: 'pld',
              docA: 'other_program',
              colA: 'management_review',
              docB: 'plant_department',
            ),
            MsppCard(
              title: 'Production Department',
              id: 'prd',
              docA: 'other_program',
              colA: 'management_review',
              docB: 'production_department',
            ),
            MsppCard(
              title: 'Logistic Department',
              id: 'ld',
              docA: 'other_program',
              colA: 'management_review',
              docB: 'logistic_department',
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
