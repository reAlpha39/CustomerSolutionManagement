import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_card/mspp_card_field.dart';
import 'package:customer/widgets/mspp/mspp_card/mspp_card_workshop.dart';
import 'package:flutter/material.dart';

class MsppInfras extends StatefulWidget {
  @override
  _MsppPsPlanState createState() => _MsppPsPlanState();
}

class _MsppPsPlanState extends State<MsppInfras>
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
            MsppCardField(),
            MsppCardWorkshop(),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
