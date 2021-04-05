import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/other_program/other_card/other_card_ao.dart';
import 'package:customer/widgets/other_program/other_card/other_card_do.dart';
import 'package:customer/widgets/other_program/other_card/other_card_lo.dart';
import 'package:customer/widgets/other_program/other_card/other_card_os.dart';
import 'package:customer/widgets/other_program/other_card/other_card_po.dart';
import 'package:customer/widgets/other_program/other_card/other_card_pro.dart';
import 'package:customer/widgets/other_program/other_card/other_card_sheo.dart';
import 'package:flutter/material.dart';

class OtherPeople extends StatefulWidget {
  @override
  _MsppPsPlanState createState() => _MsppPsPlanState();
}

class _MsppPsPlanState extends State<OtherPeople>
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
            OtherCardOs(),
            OtherCardPo(),
            OtherCardLo(),
            OtherCardPro(),
            OtherCardDo(),
            OtherCardAo(),
            OtherCardSheo(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
