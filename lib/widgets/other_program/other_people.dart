import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherPeople extends StatefulWidget {
  @override
  _MsppPsPlanState createState() => _MsppPsPlanState();
}

class _MsppPsPlanState extends State<OtherPeople>
    with AutomaticKeepAliveClientMixin {
      final MsppController controller = Get.find();
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
              title: 'Organization Structure',
              id: 'os',
              docA: 'other_program',
              colA: 'people',
              docB: 'organization_structure',
            ),
            MsppCard(
              title: 'Plant Organization',
              id: 'po',
              docA: 'other_program',
              colA: 'people',
              docB: 'plant_organization',
            ),
            MsppCard(
              title: 'Logistic Organization',
              id: 'lo',
              docA: 'other_program',
              colA: 'people',
              docB: 'logistic_organization',
            ),
            MsppCard(
              title: 'Production Organization',
              id: 'pro',
              docA: 'other_program',
              colA: 'people',
              docB: 'production_organization',
            ),
            MsppCard(
              title: 'Development Organization',
              id: 'do',
              docA: 'other_program',
              colA: 'people',
              docB: 'development_organization',
            ),MsppCard(
              title: 'Administration Organization',
              id: 'ao',
              docA: 'other_program',
              colA: 'people',
              docB: 'administration_organization',
            ),
            MsppCard(
              title: 'SHE Organization',
              id: 'sheo',
              docA: 'other_program',
              colA: 'people',
              docB: 'she_organization',
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
