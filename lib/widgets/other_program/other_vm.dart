import 'package:customer/controller/other_program_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/mspp/mspp_card.dart';
import 'package:customer/widgets/mspp/mspp_fill_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherVm extends StatefulWidget {
  @override
  _MsppPsPlanState createState() => _MsppPsPlanState();
}

class _MsppPsPlanState extends State<OtherVm>
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
              title: 'Penentuan Vendor',
              id: 'pv',
              docA: 'other_program',
              colA: 'vendor_management',
              docB: 'penentuan_vendor',
              radioIndex: controller.radioIndexPV,
              textFieldIndex: controller.textFieldPV,
            ),
            MsppCard(
              title: 'Mekanisme Transaksi dengan Vendor',
              id: 'mtdt',
              docA: 'other_program',
              colA: 'vendor_management',
              docB: 'mekanisme_transaksi_dengan_vendor',
              radioIndex: controller.radioIndexMTDT,
              textFieldIndex: controller.textFieldMTDT,
            ),
            MsppCard(
              title: 'Evaluasi Vendor',
              id: 'ev',
              docA: 'other_program',
              colA: 'vendor_management',
              docB: 'evaluasi_vendor',
              radioIndex: controller.radioIndexEV,
              textFieldIndex: controller.textFieldEV,
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
