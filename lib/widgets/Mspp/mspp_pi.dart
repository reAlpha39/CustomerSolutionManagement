import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/Mspp/mspp_card_asses.dart';
import 'package:customer/widgets/Mspp/mspp_card_meet.dart';
import 'package:customer/widgets/Mspp/mspp_card_plan_unit.dart';
import 'package:flutter/material.dart';

class MsppPi extends StatefulWidget {
  const MsppPi({
    Key key,
  }) : super(key: key);

  @override
  _MsppPiState createState() => _MsppPiState();
}

class _MsppPiState extends State<MsppPi> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            MsppCardPlanUnit(),
            MsppCardMeet(),
            MsppCardAsses(),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}