import 'package:customer/controller/login_controller.dart';
import 'package:customer/models/checklist_audit/checklist_audit.dart';
import 'package:customer/models/checklist_audit/list_checklist_audit.dart';
import 'package:customer/models/mspp.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppController extends GetxController {
  final LoginController _loginController = Get.find();
  final DatabaseProvider _databaseProvider = DatabaseProvider();

  Map<int, String> radioData = {
    0: 'Yes',
    1: 'No',
    2: 'N/A',
  };

  Rx<Mspp> msppData;
  Rx<ListChecklistAudit> tempListChecklistAudit = ListChecklistAudit().obs;
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxList<int> itemIndex = [0].obs;
  RxInt assessmentResult = (-1).obs;

  TextEditingController textEditingControllerALL;

  @override
  void onInit() {
    loadMsppChecklistAudit(username: _loginController.usr.value.username);
    textEditingControllerALL = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingControllerALL?.dispose();
    super.onClose();
  }

  loadCustomerChecklistData() {
    if (_loginController.usr.value.type == 'customer') {
      loadMsppChecklistAudit(
          username: _loginController.usr.value.username);
    }
  }

  void loadMsppChecklistAudit({String username, String part}) {
    isLoading.value = true;
    connectivityChecker().then((conn) {
      if (conn) {
        _databaseProvider.loadCheckListData(username: username, part: part).then((value) {
          tempListChecklistAudit.value = value;
          tempListChecklistAudit.refresh();
          isLoading.value = false;
        });
      } else {
        isLoading.value = false;
      }
    });
  }

  loadItem({String docA, String docB, int index, isAssessmentResult}) {
    List<ChecklistAudit> data = tempListChecklistAudit.value.checklistAudit;
    int indexA = data.indexWhere((element) => element.id == docA);
    int indexB = data[indexA]
        .checklistElement
        .indexWhere((element) => element.id == docB);
    var result;
    if (isAssessmentResult) {
      result = tempListChecklistAudit.value.checklistAudit[indexA]
          .checklistElement[indexB].checklistData[index].assessmentResult;
      assessmentResult.value = result;
    } else {
      result = tempListChecklistAudit.value.checklistAudit[indexA]
          .checklistElement[indexB].checklistData[index].remark;
    }
    return result;
  }

  void searchItemIndex({String docA, String docB, int index}) {
    List<ChecklistAudit> data = tempListChecklistAudit.value.checklistAudit;
    int indexA = data.indexWhere((element) => element.id == docA);
    int indexB = data[indexA]
        .checklistElement
        .indexWhere((element) => element.id == docB);
    itemIndex.assignAll([indexA, indexB]);
  }

  void saveItem({String docA, String docB, int index, isAssessmentResult}) {
    searchItemIndex(docA: docA, docB: docB, index: index);
    if (isAssessmentResult) {
      tempListChecklistAudit
          .value
          .checklistAudit[itemIndex[0]]
          .checklistElement[itemIndex[1]]
          .checklistData[index]
          .assessmentResult = assessmentResult.value;
    } else {
      tempListChecklistAudit
          .value
          .checklistAudit[itemIndex[0]]
          .checklistElement[itemIndex[1]]
          .checklistData[index]
          .remark = textEditingControllerALL.text;
      textEditingControllerALL.clear();
    }
    tempListChecklistAudit.refresh();
  }

  dummy() {
    _databaseProvider.dummy();
  }

  void showProgressDialog() {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
  }
}
