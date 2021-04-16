import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppOm extends StatefulWidget {
  @override
  _MsppPsPlanState createState() => _MsppPsPlanState();
}

class _MsppPsPlanState extends State<MsppOm>
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
              title: 'Ketersediaan Mekanik',
              id: 'km',
              docA: 'mspp',
              colA: 'ketersediaan_mekanik',
              docB: 'ketersediaan_mekanik',
              radioIndex: controller.radioIndexKM,
              textFieldIndex: controller.textFieldKM,
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
