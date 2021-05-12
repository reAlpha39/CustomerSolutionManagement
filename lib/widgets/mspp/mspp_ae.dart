import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppAE extends StatefulWidget {
  const MsppAE({
    Key? key,
  }) : super(key: key);

  @override
  _MsppAEState createState() => _MsppAEState();
}

class _MsppAEState extends State<MsppAE> with AutomaticKeepAliveClientMixin {
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
              title: 'Application Engineer A',
              id: 'aea',
              docA: 'mspp',
              colA: 'application_engineer',
              docB: 'application_engineer_a',
            ),
            MsppCard(
              title: 'Application Engineer B',
              id: 'aeb',
              docA: 'mspp',
              colA: 'application_engineer',
              docB: 'application_engineer_b',
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
