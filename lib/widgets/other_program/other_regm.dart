import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/other_program/other_card/other_card_rm.dart';
import 'package:flutter/material.dart';

class OtherRegm extends StatefulWidget {
  @override
  _MsppPsPlanState createState() => _MsppPsPlanState();
}

class _MsppPsPlanState extends State<OtherRegm>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            OtherCardRm(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
