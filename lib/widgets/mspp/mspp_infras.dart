import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppInfras extends StatefulWidget {
  @override
  _MsppPsPlanState createState() => _MsppPsPlanState();
}

class _MsppPsPlanState extends State<MsppInfras>
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
              title: 'Field',
              id: 'field',
              docA: 'mspp',
              colA: 'infrastructure',
              docB: 'field',
              radioIndex: controller.radioIndexFIELD,
              textFieldIndex: controller.textFieldFIELD,
            ),
            MsppCard(
              title: 'Workshop',
              id: 'workshop',
              docA: 'mspp',
              colA: 'infrastructure',
              docB: 'workshop',
              radioIndex: controller.radioIndexWORKSHOP,
              textFieldIndex: controller.textFieldWORKSHOP,
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
