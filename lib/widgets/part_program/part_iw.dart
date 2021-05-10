import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
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
            MsppFillHelper(),
            MsppCard(
              title: 'Continuous Improvement',
              id: 'ci',
              docA: 'part_program',
              colA: 'inventory_warehousing',
              docB: 'continuous_improvement',
              isIwTable: true,
            ),
            MsppCard(
              title: 'Health',
              id: 'he',
              docA: 'part_program',
              colA: 'inventory_warehousing',
              docB: 'health',
              isIwTable: true,
            ),
            MsppCard(
              title: 'Infrastructure',
              id: 'if',
              docA: 'part_program',
              colA: 'inventory_warehousing',
              docB: 'infrastructure',
              isIwTable: true,
            ),
            MsppCard(
              title: 'Operations',
              id: 'op',
              docA: 'part_program',
              colA: 'inventory_warehousing',
              docB: 'operations',
              isIwTable: true,
            ),
            MsppCard(
              title: 'People',
              id: 'pe',
              docA: 'part_program',
              colA: 'inventory_warehousing',
              docB: 'people',
              isIwTable: true,
            ),
            MsppCard(
              title: 'Tools',
              id: 'ts',
              docA: 'part_program',
              colA: 'inventory_warehousing',
              docB: 'tools',
              isIwTable: true,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
