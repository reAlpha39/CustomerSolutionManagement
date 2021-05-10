import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:flutter/material.dart';

class PartKp extends StatefulWidget {
  @override
  _PartKpState createState() => _PartKpState();
}

class _PartKpState extends State<PartKp> with AutomaticKeepAliveClientMixin {
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
              title: 'Ketersediaan Part',
              id: 'kp',
              docA: 'part_program',
              colA: 'ketersediaan_part',
              docB: 'kp',
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
