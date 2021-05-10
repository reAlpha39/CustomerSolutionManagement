import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:customer/widgets/pica_analysis/pica_detail_matrix_table.dart';
import 'package:customer/widgets/pica_analysis/pica_detail_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PicaAnalysisController extends GetxController {
  PicaCardTableController _picaCT = Get.find(tag: 'global');
  HomeController _homeController = Get.find();

  RxInt navBarIndex = 0.obs;
  RxInt indexDetailData = 0.obs;
  RxString idDetailData = "".obs;

  PanelController panelController;

  @override
  void onInit() {
    panelController = PanelController();
    super.onInit();
  }

  void showDetailCard(int indexData, String idData) {
    // _picaCT.counterMainCard(indexData);
    indexDetailData.value = indexData;
    idDetailData.value = idData;
    panelController.open();
  }

  void changeOpenedIndexData() {
    try {
      if (panelController.isPanelOpen) {
        int index = _homeController.tempListChecklistAudit.value.checklistAudit
            .indexWhere((element) => element.id.contains(idDetailData.value));
        print(index);
        indexDetailData.value = index;
      }
    } catch (e) {
      print(e);
    }
  }

  Widget picaTable(String tag) {
    if (navBarIndex.value == 1) {
      return PicaDetailTable(tag: tag);
    } else if (navBarIndex.value == 2) {
      return PicaDetailMatrixTable(tag: tag);
    } else {
      return Container();
    }
  }
}
