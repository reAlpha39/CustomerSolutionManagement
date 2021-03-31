import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/Mspp/mspp_card_appt.dart';
import 'package:customer/widgets/Mspp/mspp_card_eds.dart';
import 'package:customer/widgets/Mspp/mspp_card_epss.dart';
import 'package:customer/widgets/Mspp/mspp_card_hptd.dart';
import 'package:customer/widgets/Mspp/mspp_card_rpll.dart';
import 'package:customer/widgets/Mspp/mspp_card_tpsnp.dart';
import 'package:flutter/material.dart';

class MsppPs extends StatefulWidget {
  @override
  _MsppPsPlanState createState() => _MsppPsPlanState();
}

class _MsppPsPlanState extends State<MsppPs>
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
            MsppCardAppt(),
            MsppCardEpss(),
            MsppCardTpsnp(),
            MsppCardHptd(),
            MsppCardEds(),
            MsppCardRpll(),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
