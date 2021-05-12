import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/pica_analysis_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaDetailCard extends StatelessWidget {
  final PicaAnalysisController picaAController = Get.find();
  final HomeController _homeController = Get.find();
  final String? tag;
  final Widget? picaData;

  PicaDetailCard({Key? key, this.tag, this.picaData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PicaCardTableController controller = Get.find(tag: tag);
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: ExpandableNotifier(
            controller: controller.expandableController,
            child: ScrollOnExpand(
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: false,
                  hasIcon: true,
                ),
                header: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Obx(
                            () => Center(
                                child: Text(
                              _homeController
                                  .tempListChecklistAudit
                                  .value
                                  .checklistAudit![controller.indexData.value]
                                  .checklistElement![controller.indexCard.value]
                                  .result
                                  .toString(),
                              style: TextStyle(
                                color: Color(0xff665210),
                              ),
                            )),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffffcd29),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          controller.title.value,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                collapsed: Container(),
                expanded: picaData!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
