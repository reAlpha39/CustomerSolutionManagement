import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:customer/widgets/pica_analysis/pica_observation_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaObservation extends StatelessWidget {
  final PicaCardTableController picaCTController = Get.find(tag: 'global');
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      child: SingleChildScrollView(
        child: Obx(
          () => picaCTController.picaData.value.picaElement == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: List<Widget>.generate(
                    picaCTController.picaData.value.picaElement.length,
                    (index) => Obx(
                      () => PicaObservationCard(
                        indexValue: index,
                        title: picaCTController
                            .picaData.value.picaElement[index].title,
                        id: picaCTController
                            .picaData.value.picaElement[index].id,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
