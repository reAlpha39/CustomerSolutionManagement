import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/Mspp/mspp_card/mspp_card_ade.dart';
import 'package:customer/widgets/Mspp/mspp_card/mspp_card_bsps.dart';
import 'package:customer/widgets/Mspp/mspp_card/mspp_card_ccd.dart';
import 'package:customer/widgets/Mspp/mspp_card/mspp_card_rcps.dart';
import 'package:customer/widgets/mspp/mspp_card/mspp_card_opp.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:flutter/material.dart';

class MsppPsPlan extends StatefulWidget {
  @override
  _MsppPsPlanState createState() => _MsppPsPlanState();
}

class _MsppPsPlanState extends State<MsppPsPlan>
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
            MsppFillHelper(),
            MsppCardCcd(),
            MsppCardOpp(),
            MsppCardBsps(),
            MsppCardRcps(),
            MsppCardAde(),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
