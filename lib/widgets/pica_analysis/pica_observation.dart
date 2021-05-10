import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:customer/widgets/pica_analysis/pica_observation_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaObservation extends StatelessWidget {
  final PicaCardTableController picaCTController = Get.find(tag: 'global');
  final HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      child: SingleChildScrollView(
        child: Obx(
          () => _homeController.tempListChecklistAudit.value.checklistAudit ==
                  null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: List<Widget>.generate(
                    _homeController
                        .tempListChecklistAudit.value.checklistAudit.length,
                    (index) => Obx(
                      () => PicaObservationCard(
                        indexValue: index,
                        title: _homeController.tempListChecklistAudit.value
                            .checklistAudit[index].title,
                        id: _homeController.tempListChecklistAudit.value
                            .checklistAudit[index].id,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
