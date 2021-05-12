import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:customer/widgets/pica_analysis/pica_observation.dart';
import 'package:customer/widgets/pica_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PicaAnalysisController extends GetxController {
  final PicaCardTableController _picaCT = Get.find(tag: 'global');
  final HomeController _homeController = Get.find();

  RxInt navBarIndex = 0.obs;
  RxInt indexDetailData = 0.obs;
  RxString idDetailData = "".obs;

  PanelController? panelController;

  @override
  void onInit() {
    panelController = PanelController();
    super.onInit();
  }

  Widget? widgetOptions() {
    Widget? display;
    switch (navBarIndex.value) {
      case 0:
        display = PicaChart();
        break;
      case 1:
        _picaCT.sortMainCard();
        display = PicaObservation();

        break;
      case 2:
        _picaCT.sortMainCard();
        display = PicaObservation();
        break;
      default:
    }
    return display;
  }

  void showDetailCard(int indexData, String idData) {
    indexDetailData.value = indexData;
    idDetailData.value = idData;
    panelController!.open();
  }

  void changeOpenedIndexData() {
    try {
      if (panelController!.isPanelOpen) {
        int index = _homeController.tempListChecklistAudit.value.checklistAudit!
            .indexWhere((element) => element.id!.contains(idDetailData.value));
        print(index);
        indexDetailData.value = index;
      }
    } catch (e) {
      print(e);
    }
  }
}
