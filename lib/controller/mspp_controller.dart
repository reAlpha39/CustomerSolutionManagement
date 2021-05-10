import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:customer/models/checklist_audit/checklist_audit.dart';
import 'package:customer/models/mspp.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppController extends GetxController {
  final HomeController _homeController = Get.find();
  final DatabaseProvider _databaseProvider = DatabaseProvider();

  Map<int, String> radioData = {
    0: 'Yes',
    1: 'No',
    2: 'N/A',
  };

  Rx<Mspp> msppData;
  RxBool isLoading = false.obs;
  RxList<int> itemIndex = [0].obs;
  RxInt assessmentResult = (-1).obs;

  TextEditingController textEditingControllerALL;

  @override
  void onInit() {
    textEditingControllerALL = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingControllerALL?.dispose();
    super.onClose();
  }

  loadItem({String docA, String docB, int index, isAssessmentResult}) {
    List<ChecklistAudit> data =
        _homeController.tempListChecklistAudit.value.checklistAudit;
    int indexA = data.indexWhere((element) => element.id == docA);
    int indexB = data[indexA]
        .checklistElement
        .indexWhere((element) => element.id == docB);
    var result;
    if (isAssessmentResult) {
      result = _homeController
          .tempListChecklistAudit
          .value
          .checklistAudit[indexA]
          .checklistElement[indexB]
          .checklistData[index]
          .assessmentResult;
      assessmentResult.value = result;
    } else {
      result = _homeController
          .tempListChecklistAudit
          .value
          .checklistAudit[indexA]
          .checklistElement[indexB]
          .checklistData[index]
          .remark;
    }
    return result;
  }

  void searchItemIndex({String docA, String docB, int index}) {
    List<ChecklistAudit> data =
        _homeController.tempListChecklistAudit.value.checklistAudit;
    int indexA = data.indexWhere((element) => element.id == docA);
    int indexB = data[indexA]
        .checklistElement
        .indexWhere((element) => element.id == docB);
    itemIndex.assignAll([indexA, indexB]);
  }

  void saveItem({String docA, String docB, int index, isAssessmentResult}) {
    PicaCardTableController _picaCT = Get.find(tag: 'global');
    searchItemIndex(docA: docA, docB: docB, index: index);
    if (isAssessmentResult) {
      _homeController
          .tempListChecklistAudit
          .value
          .checklistAudit[itemIndex[0]]
          .checklistElement[itemIndex[1]]
          .checklistData[index]
          .assessmentResult = assessmentResult.value;
      if (assessmentResult.value == 1) {
        _homeController
            .tempListChecklistAudit
            .value
            .checklistAudit[itemIndex[0]]
            .checklistElement[itemIndex[1]]
            .checklistData[index]
            .isNo = true;
      } else {
        _homeController
            .tempListChecklistAudit
            .value
            .checklistAudit[itemIndex[0]]
            .checklistElement[itemIndex[1]]
            .checklistData[index]
            .isNo = false;
      }
      _picaCT.counter(indexA: itemIndex[0], indexB: itemIndex[1]);
    } else {
      _homeController
          .tempListChecklistAudit
          .value
          .checklistAudit[itemIndex[0]]
          .checklistElement[itemIndex[1]]
          .checklistData[index]
          .remark = textEditingControllerALL.text;
      textEditingControllerALL.clear();
      _homeController.tempListChecklistAudit.refresh();
    }
  }

  dummy() {
    _databaseProvider.dummy();
  }

  void showProgressDialog() {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
  }
}
