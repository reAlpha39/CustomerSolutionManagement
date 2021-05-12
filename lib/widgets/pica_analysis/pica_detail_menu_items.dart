import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/controller/pica_analysis_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaDetailMenuItems extends StatelessWidget {
  final PicaAnalysisController picaAController = Get.find();
  final PicaCardTableController picaCTController = Get.find(tag: 'global');
  final HomeController _homeController = Get.find();
  final MsppController msppController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Obx(
          () => _homeController.tempListChecklistAudit.value.checklistAudit ==
                  null
              ? CircularProgressIndicator()
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List<Widget>.generate(
                      _homeController
                          .tempListChecklistAudit
                          .value
                          .checklistAudit![picaAController.indexDetailData.value]
                          .checklistElement!
                          .length, (index) {
                    PicaCardTableController picaCTCTag = Get.find(
                        tag: _homeController
                            .tempListChecklistAudit
                            .value
                            .checklistAudit![
                                picaAController.indexDetailData.value]
                            .checklistElement![index]
                            .id);
                    return picaCTCTag.picaDetailCard(
                        index, _homeController.tempListChecklistAudit.value);
                  }),
                ),
        ),
      ),
    );
  }
}
