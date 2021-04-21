import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:customer/widgets/pica_analysis/pica_observation_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaObservation extends StatelessWidget {
  final PicaCardTableController picaCTController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      child: SingleChildScrollView(
        child: Column(
          children: List<Widget>.generate(
            picaCTController.picaData.value.toMap().length,
            (index) => PicaObservationCard(
              keyValues:
                  picaCTController.picaData.value.toMap().keys.elementAt(index),
              title:
                  picaCTController.picaData.value.toMap().keys.elementAt(index),
            ),
          ),
        ),
      ),
    );
  }
}
