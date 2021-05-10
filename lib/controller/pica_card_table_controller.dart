import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/controller/pica_analysis_controller.dart';
import 'package:customer/models/checklist_audit/checklist_audit.dart';
import 'package:customer/models/checklist_audit/checklist_data.dart';
import 'package:customer/models/checklist_audit/list_checklist_audit.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:customer/widgets/pica_analysis/pica_detail_card.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaCardTableController extends GetxController {
  final LoginController loginController = Get.find();
  final HomeController _homeController = Get.find();
  ExpandableController expandableController;
  TextEditingController textEditingControllerALL;
  RxList<int> indexResultA = RxList<int>();
  RxList<int> indexResultB = RxList<int>();
  RxList<bool> boolIndex = RxList<bool>();
  RxList<int> loadIndex;
  RxBool isLoading = false.obs;

  RxString id = "".obs;
  RxString title = "".obs;
  RxInt indexData = 0.obs;
  RxInt indexCard = 0.obs;
  RxString docA = "".obs;
  RxString colA = "".obs;
  RxString docB = "".obs;
  RxBool dataTableFilter = false.obs;
  RxList<int> dataTableListRadio = RxList<int>();
  int dataTableRadioIndex = 1;

  @override
  void onInit() {
    expandableController = ExpandableController();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingControllerALL?.dispose();
    expandableController?.dispose();
  }

  void textEditingController() {
    textEditingControllerALL = TextEditingController();
  }

  void fillTextData(int indexData, int indexCard, int index, String id) {
    switch (id) {
      case "Actual":
        _homeController
            .tempListChecklistAudit
            .value
            .checklistAudit[indexData]
            .checklistElement[indexCard]
            .checklistData[index]
            .actual = textEditingControllerALL.text.toString();
        break;
      case "Target":
        _homeController
            .tempListChecklistAudit
            .value
            .checklistAudit[indexData]
            .checklistElement[indexCard]
            .checklistData[index]
            .target = textEditingControllerALL.text.toString();
        break;
      case "Priority":
        _homeController
            .tempListChecklistAudit
            .value
            .checklistAudit[indexData]
            .checklistElement[indexCard]
            .checklistData[index]
            .improv = textEditingControllerALL.text.toString();
        break;
      default:
    }
  }

  Widget picaDetailCard(int index, ListChecklistAudit listChecklistAudit) {
    PicaAnalysisController picaAController = Get.find();
    bool isNo = false;
    List<int> radioData = [];
    var data = listChecklistAudit
        .checklistAudit[picaAController.indexDetailData.value]
        .checklistElement[index];
    for (int i = 0; i < data.checklistData.length; i++) {
      radioData.add(data.checklistData[i].assessmentResult);
    }

    if (radioData.contains(1)) {
      isNo = true;
    }

    if (isNo) {
      title.value = data.title;
      id.value = data.id;
      indexData.value = picaAController.indexDetailData.value;
      indexCard.value = index;
      docA.value = data.tablePath.docA;
      colA.value = data.tablePath.colA;
      docB.value = data.tablePath.docB;
      dataTableFilter.value = true;
      dataTableRadioIndex = 1;
      dataTableListRadio.value = radioData;
      print("in list: " + data.id);
      return PicaDetailCard(tag: data.id);
    } else {
      print("not in list: " + data.id);
      return Container();
    }
  }

  counter({int indexB, int indexA}) {
    int temp = 0;
    List<ChecklistAudit> dataA =
        _homeController.tempListChecklistAudit.value.checklistAudit;
    if (dataA != null) {
      List<ChecklistData> list =
          dataA[indexA].checklistElement[indexB].checklistData;
      for (int i = 0; i <= list.length - 1; i++) {
        if (list[i].isNo) {
          temp += list[i].dampak;
          temp += list[i].urgensi;
        }
      }
      _homeController.tempListChecklistAudit.value.checklistAudit[indexA]
          .checklistElement[indexB].result = temp;
      _sortCard(indexA, dataA);
    } else {
      print("counter's PicaData null");
    }
  }

  void displayIndex(int indexCard, int indexData,
      {bool isGlobal = true, String tag}) {
    List<ChecklistAudit> dataA =
        _homeController.tempListChecklistAudit.value.checklistAudit;
    loadIndex = RxList<int>();
    List<int> data = [];
    List<int> data2 = [];
    List<bool> data3 = [];
    List<ChecklistData> dataB =
        dataA[indexData].checklistElement[indexCard].checklistData;
    for (int i = 0; i <= dataB.length - 1; i++) {
      if (dataB[i].isNo) {
        loadIndex.add(i);
      }
    }
    for (int j = 0; j <= dataB.length - 1; j++) {
      data.add(dataB[j].urgensi);
      data2.add(dataB[j].dampak);
      data3.add(dataB[j].isNo);
    }
    if (indexResultA.length == 0 || indexResultB.length == 0) {
      indexResultA.addAll(data);
      indexResultB.addAll(data2);
    }
    if (boolIndex.length == 0) {
      boolIndex.addAll(data3);
    }
    print("isGlobal: " + isGlobal.toString());
    print('tag: $tag');
    print(data);
    print(data2);
    print(data3);
    print('v');
  }

  void _sortCard(int indexData, List<ChecklistAudit> listCA) {
    try {
      _homeController.tempListChecklistAudit.value.checklistAudit[indexData]
          .checklistElement
          .sort((a, b) => b.result.compareTo(a.result));
    } catch (e) {
      print(e);
    }
    _counterMainCard(indexData, listCA);
  }

  void _counterMainCard(int indexData, List<ChecklistAudit> listCA) {
    try {
      int length = listCA[indexData].checklistElement.length;
      int counter = 0;
      for (int i = 0; i <= length - 1; i++) {
        counter += listCA[indexData].checklistElement[i].result;
      }
      _homeController.tempListChecklistAudit.value.checklistAudit[indexData]
          .score = counter;
      sortMainCard();
      _homeController.tempListChecklistAudit.refresh();
    } catch (e) {
      print("counterMainCard: " + e.toString());
    }
  }

  void sortMainCard() {
    try {
      _homeController.tempListChecklistAudit.value.checklistAudit
          .sort((a, b) => b.score.compareTo(a.score));
    } catch (e) {
      print("sortMainCard: " + e.toString());
    }
  }

  void saveData() {
    isLoading.value = true;
    for (int i = 0; i <= boolIndex.length - 1; i++) {
      _homeController
          .tempListChecklistAudit
          .value
          .checklistAudit[indexData.value]
          .checklistElement[indexCard.value]
          .checklistData[i]
          .isNo = boolIndex[i];
    }
    _homeController.tempListChecklistAudit.refresh();
    counter(indexA: indexData.value, indexB: indexCard.value);
    connectivityChecker().then((conn) {
      if (conn) {
        // _databaseProvider
        //     .savePicaData(picaData.value, loginController.usr.value.username)
        //     .then((value) {
        //   if (value) {
        //     _databaseProvider.showDialog(
        //         title: 'Sukses', middleText: 'Data berhasil di update');
        //     isLoading.value = false;
        //   }
        // });
      } else {
        isLoading.value = false;
      }
    });
  }
}
