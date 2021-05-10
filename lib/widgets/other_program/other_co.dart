import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherCo extends StatefulWidget {
  @override
  _OtherCoState createState() => _OtherCoState();
}

class _OtherCoState extends State<OtherCo> with AutomaticKeepAliveClientMixin {
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
              title: 'Plant',
              id: 'pl',
              docA: 'other_program',
              colA: 'customer_overview',
              docB: 'plant',
            ),
            MsppCard(
              title: 'Production',
              id: 'pr',
              docA: 'other_program',
              colA: 'customer_overview',
              docB: 'production',
            ),
            MsppCard(
              title: 'Logistic',
              id: 'lg',
              docA: 'other_program',
              colA: 'customer_overview',
              docB: 'logistic',
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
