import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/other_program/other_card/other_card_ev.dart';
import 'package:customer/widgets/other_program/other_card/other_card_mtdv.dart';
import 'package:customer/widgets/other_program/other_card/other_card_pv.dart';
import 'package:flutter/material.dart';

class OtherVm extends StatefulWidget {
  @override
  _MsppPsPlanState createState() => _MsppPsPlanState();
}

class _MsppPsPlanState extends State<OtherVm>
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
            OtherCardPv(),
            OtherCardMtdv(),
            OtherCardEv(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
