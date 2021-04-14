import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/part_program/part_card/part_kp_card.dart';
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
            PartKpCard(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
