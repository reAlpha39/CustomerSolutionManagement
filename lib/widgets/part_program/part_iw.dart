import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/part_program/part_card/part_op_card.dart';
import 'package:flutter/material.dart';

class PartIw extends StatefulWidget {
  @override
  _PartIwState createState() => _PartIwState();
}

class _PartIwState extends State<PartIw> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            PartOpCard(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
