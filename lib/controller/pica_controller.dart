import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/controller/other_program_controller.dart';
import 'package:customer/controller/part_program_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PicaController extends GetxController {
  MsppController _mspp = Get.find();
  OtherProgramController _other = Get.find();
  PartProgramController _part = Get.find();
  PicaCardTableController _picaCT = Get.find(tag: 'global');

  RxList<int> indexPI = RxList<int>();
  RxList<int> indexPSP = RxList<int>();
  RxList<int> indexPS = RxList<int>();
  RxList<int> indexOVHP = RxList<int>();
  RxList<int> indexOVH = RxList<int>();
  RxList<int> indexUSC = RxList<int>();
  RxList<int> indexTOOLS = RxList<int>();
  RxList<int> indexCBM = RxList<int>();
  RxList<int> indexINFRAS = RxList<int>();
  RxList<int> indexPEOPLE = RxList<int>();
  RxList<int> indexIW = RxList<int>();
  RxList<int> indexVM = RxList<int>();
  RxList<int> indexAE = RxList<int>();
  RxList<int> indexMR = RxList<int>();
  RxList<int> indexOM = RxList<int>();
  RxList<int> indexOP = RxList<int>();
  RxList<int> indexOS = RxList<int>();
  RxList<int> indexRM = RxList<int>();
  RxList<int> indexCO = RxList<int>();

  RxMap<int, RxList<int>> listIndex;

  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;

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
    _picaCT.loadData();
    indexDetailData.value = indexData;
    idDetailData.value = idData;
    panelController.open();
  }

  void changeOpenedIndexData() {
    try {
      if (panelController.isPanelOpen) {
        int index = _picaCT.picaData.value.picaElement
            .indexWhere((element) => element.id.contains(idDetailData.value));
        print(index);
        indexDetailData.value = index;
      }
    } catch (e) {
      print(e);
    }
  }

  listedIndex() {
    listIndex = {
      0: indexPI,
      1: indexPSP,
      2: indexPS,
      3: indexOVHP,
      4: indexOVH,
      5: indexUSC,
      6: indexTOOLS,
      7: indexCBM,
      8: indexINFRAS,
      9: indexPEOPLE,
      10: indexIW,
      11: indexVM,
      12: indexAE,
      13: indexMR,
      14: indexOM,
      15: indexOP,
      16: indexOS,
      17: indexRM,
      18: indexCO,
    }.obs;
  }

  scorePica(List<int> list) {
    List<int> data = filterList(list);
    double percentage = 0.0;
    double score = 0;
    try {
      score = data[0].toDouble() / (data[1].toDouble() + data[0].toDouble());
      percentage = score * 100;
    } catch (e) {}
    if (percentage.isNaN) {
      percentage = 0.1;
    }
    return percentage;
  }

  List<Color> colorBar(double score) {
    List<Color> color;
    if (score < 74.0) {
      color = [Colors.black, Colors.black87];
    } else if (score >= 74.0 && score < 83.0) {
      color = [Colors.red.shade900, Colors.red.shade400];
    } else if (score >= 83.0 && score < 93.0) {
      color = [Colors.yellow.shade900, Colors.yellow.shade400];
    } else if (score >= 93.0) {
      color = [Colors.green.shade900, Colors.green.shade400];
    }
    return color;
  }

  List<int> filterList(List<int> list) {
    int yes = 0;
    int no = 0;
    int na = 0;
    for (int i = 0; i <= list.length - 1; i++) {
      switch (list[i]) {
        case -1:
          na++;
          break;
        case 0:
          yes++;
          break;
        case 1:
          no++;
          break;
        case 2:
          na++;
          break;
        default:
          na++;
      }
    }
    List<int> counted = [yes, no, na];
    return counted;
  }

  combineList() {
    if (!isLoaded.value) {
      indexPI.assignAll([
        _mspp.radioIndexPU,
        _mspp.radioIndexMeet,
        _mspp.radioIndexAsses
      ].expand((x) => x).toList());
      indexPSP.assignAll([
        _mspp.radioIndexCCD,
        _mspp.radioIndexOPPSP,
        _mspp.radioIndexBSPSP,
        _mspp.radioIndexRCPSP,
        _mspp.radioIndexADE
      ].expand((element) => element).toList());
      indexPS.assignAll([
        _mspp.radioIndexPPS,
        _mspp.radioIndexAPPT,
        _mspp.radioIndexEPSS,
        _mspp.radioIndexTPSNP,
        _mspp.radioIndexHPTD,
        _mspp.radioIndexEDS,
        _mspp.radioIndexRPLL
      ].expand((element) => element).toList());
      indexOVHP.assignAll([
        _mspp.radioIndexCCCD,
        _mspp.radioIndexOPOP,
        _mspp.radioIndexBSOP,
        _mspp.radioIndexRCOP,
        _mspp.radioIndexAME
      ].expand((element) => element).toList());
      indexOVH.assignAll([
        _mspp.radioIndexPL,
        _mspp.radioIndexAR,
        _mspp.radioIndexNT,
        _mspp.radioIndexTR,
        _mspp.radioIndexHPS,
        _mspp.radioIndexEJ,
        _mspp.radioIndexRE
      ].expand((element) => element).toList());
      indexUSC.assignAll([
        _mspp.radioIndexTO,
        _mspp.radioIndexIUIP,
        _mspp.radioIndexGAR,
        _mspp.radioIndexEDR,
        _mspp.radioIndexRJ
      ].expand((element) => element).toList());
      indexTOOLS.assignAll([_mspp.radioIndexCTST, _mspp.radioIndexMTDT]
          .expand((element) => element)
          .toList());
      indexCBM.assignAll([
        _mspp.radioIndexPLCBM,
        _mspp.radioIndexARCBM,
        _mspp.radioIndexTACBM,
        _mspp.radioIndexEVCBM
      ].expand((element) => element).toList());
      indexINFRAS.assignAll([_mspp.radioIndexFIELD, _mspp.radioIndexWORKSHOP]
          .expand((element) => element)
          .toList());
      indexPEOPLE.assignAll([
        _other.radioIndexOS,
        _other.radioIndexPO,
        _other.radioIndexLO,
        _other.radioIndexPRO,
        _other.radioIndexDO,
        _other.radioIndexAO,
        _other.radioIndexSHEO
      ].expand((element) => element).toList());
      indexIW.assignAll([
        _part.radioIndexOP,
        _part.radioIndexPE,
        _part.radioIndexTS,
        _part.radioIndexCI,
        _part.radioIndexIF,
        _part.radioIndexHE
      ].expand((element) => element).toList());
      indexVM.assignAll([
        _other.radioIndexPV,
        _other.radioIndexMTDT,
        _other.radioIndexEV
      ].expand((element) => element).toList());
      indexAE.assignAll([_mspp.radioIndexAEA, _mspp.radioIndexAEB]
          .expand((element) => element)
          .toList());
      indexMR.assignAll([
        _other.radioIndexPLD,
        _other.radioIndexPRD,
        _other.radioIndexLD
      ].expand((element) => element).toList());
      indexOM.assignAll(_mspp.radioIndexKM);
      indexOP.assignAll(_part.radioIndexKP);
      indexOS.assignAll(_mspp.radioIndexLTPP);
      indexRM.assignAll(_other.radioIndexRM);
      indexCO.assignAll([
        _other.radioIndexPL,
        _other.radioIndexPR,
        _other.radioIndexLG
      ].expand((element) => element).toList());
      listedIndex();
      isLoaded.value = true;
    }
  }
}
