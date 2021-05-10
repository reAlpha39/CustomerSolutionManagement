import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/mspp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaChartController extends GetxController {
  HomeController _homeController = Get.find();

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
    if (percentage.isNaN || percentage == 0.0) {
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

  void combineList() {
    if (_homeController.tempListChecklistAudit.value.checklistAudit != null) {
      listedIndex();
      var dataA = _homeController.tempListChecklistAudit.value.checklistAudit;
      dataA.sort(((a, b) => a.index.compareTo(b.index)));
      for (int i = 0; i <= dataA.length - 1; i++) {
        List<int> temp = [];
        var dataB = dataA[i].checklistElement;
        for (int j = 0; j <= dataB.length - 1; j++) {
          var dataC = dataB[j].checklistData;
          for (int k = 0; k <= dataC.length - 1; k++) {
            temp.add(dataC[k].assessmentResult);
          }
        }
        listIndex[i].assignAll(temp);
      }
    }
  }
}
