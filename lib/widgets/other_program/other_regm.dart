import 'package:customer/controller/other_program_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherRegm extends StatefulWidget {
  @override
  _MsppPsPlanState createState() => _MsppPsPlanState();
}

class _MsppPsPlanState extends State<OtherRegm>
    with AutomaticKeepAliveClientMixin {
      final OtherProgramController controller = Get.find();
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
              title: 'Regular Meeting',
              id: 'rm',
              docA: 'other_program',
              colA: 'regular_meeting',
              docB: 'regular_meeting',
              radioIndex: controller.radioIndexRM,
              textFieldIndex: controller.textFieldRM,
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
