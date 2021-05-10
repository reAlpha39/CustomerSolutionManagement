import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:customer/controller/pica_analysis_controller.dart';
import 'package:customer/widgets/pica_analysis/pica_detail_menu_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class PicaDetailMenuCard extends StatelessWidget {
  final PicaAnalysisController picaAController = Get.find();
  final PicaCardTableController picaCTController = Get.find(tag: 'global');
  final HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffffcd29),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 72.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      child: Obx(
        () => _homeController.tempListChecklistAudit.value.checklistAudit ==
                null
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              )
            : Column(
                children: [
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TextButton(
                              onPressed: () =>
                                  picaAController.panelController.close(),
                              child: Icon(
                                LineIcons.times,
                                color: Colors.black87,
                              ),
                            ),
                            Obx(
                              () => Container(
                                width: 220,
                                child: Text(
                                  _homeController
                                      .tempListChecklistAudit
                                      .value
                                      .checklistAudit[
                                          picaAController.indexDetailData.value]
                                      .title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.black26),
                            ),
                            child: Center(
                                child: Obx(
                              () => Text(
                                _homeController
                                    .tempListChecklistAudit
                                    .value
                                    .checklistAudit[
                                        picaAController.indexDetailData.value]
                                    .score
                                    .toString(),
                                style: TextStyle(color: Colors.black87),
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(17),
                        ),
                      ),
                      child: PicaDetailMenuItems(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
