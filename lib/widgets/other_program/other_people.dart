import 'package:customer/controller/other_program_controller.dart';
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
      final OtherProgramController controller = Get.find();
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
              radioIndex: controller.radioIndexOS,
              textFieldIndex: controller.textFieldOS,
            ),
            MsppCard(
              title: 'Plant Organization',
              id: 'po',
              docA: 'other_program',
              colA: 'people',
              docB: 'plant_organization',
              radioIndex: controller.radioIndexPO,
              textFieldIndex: controller.textFieldPO,
            ),
            MsppCard(
              title: 'Logistic Organization',
              id: 'lo',
              docA: 'other_program',
              colA: 'people',
              docB: 'logistic_organization',
              radioIndex: controller.radioIndexLO,
              textFieldIndex: controller.textFieldLO,
            ),
            MsppCard(
              title: 'Production Organization',
              id: 'pro',
              docA: 'other_program',
              colA: 'people',
              docB: 'production_organization',
              radioIndex: controller.radioIndexPRO,
              textFieldIndex: controller.textFieldPRO,
            ),
            MsppCard(
              title: 'Development Organization',
              id: 'do',
              docA: 'other_program',
              colA: 'people',
              docB: 'development_organization',
              radioIndex: controller.radioIndexDO,
              textFieldIndex: controller.textFieldDO,
            ),MsppCard(
              title: 'Administration Organization',
              id: 'ao',
              docA: 'other_program',
              colA: 'people',
              docB: 'administration_organization',
              radioIndex: controller.radioIndexAO,
              textFieldIndex: controller.textFieldAO,
            ),
            MsppCard(
              title: 'SHE Organization',
              id: 'sheo',
              docA: 'other_program',
              colA: 'people',
              docB: 'she_organization',
              radioIndex: controller.radioIndexSHEO,
              textFieldIndex: controller.textFieldSHEO,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
