import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/controller/pica_analysis_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaDetailMenuItems extends StatelessWidget {
  final PicaAnalysisController picaAController = Get.find();
  final PicaCardTableController picaCTController = Get.find(tag: 'global');
  final MsppController msppController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Obx(
          () => picaCTController.picaData.value.picaElement == null
              ? CircularProgressIndicator()
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List<Widget>.generate(
                    picaCTController
                        .picaData
                        .value
                        .picaElement[picaAController.indexDetailData.value]
                        .picaDetail
                        .length,
                    (index) => Obx(() {
                      PicaCardTableController picaCTCTag = Get.find(
                          tag: picaCTController
                              .picaData
                              .value
                              .picaElement[
                                  picaAController.indexDetailData.value]
                              .picaDetail[index]
                              .id);
                      return picaCTCTag.picaDetailCard(
                          index, picaCTController.picaData.value);
                    }),
                  ),
                ),
        ),
      ),
    );
  }
}
