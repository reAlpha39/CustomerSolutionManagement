import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:customer/models/checklist_audit/checklist_audit.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:customer/utils/progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppController extends GetxController {
  final HomeController _homeController = Get.find();
  final LoginController _loginController = Get.find();
  final DatabaseProvider _databaseProvider = DatabaseProvider();

  Map<int, String> radioData = {
    0: 'Yes',
    1: 'No',
    2: 'N/A',
  };

  RxBool isLoading = false.obs;
  RxList<int> itemIndex = [0].obs;
  RxInt assessmentResult = (-1).obs;

  TextEditingController? textEditingControllerALL;

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

  loadItem(
      {String? docA, String? docB, int? index, required isAssessmentResult}) {
    List<ChecklistAudit> data =
        _homeController.tempListChecklistAudit.value.checklistAudit!;
    int indexA = data.indexWhere((element) => element.id == docA);
    int indexB = data[indexA]
        .checklistElement!
        .indexWhere((element) => element.id == docB);
    var result;
    if (isAssessmentResult) {
      result = _homeController
          .tempListChecklistAudit
          .value
          .checklistAudit![indexA]
          .checklistElement![indexB]
          .checklistData![index!]
          .assessmentResult;
      assessmentResult.value = result;
    } else {
      result = _homeController
          .tempListChecklistAudit
          .value
          .checklistAudit![indexA]
          .checklistElement![indexB]
          .checklistData![index!]
          .remark;
    }
    return result;
  }

  void searchItemIndex({String? docA, String? docB, int? index}) {
    List<ChecklistAudit> data =
        _homeController.tempListChecklistAudit.value.checklistAudit!;
    int indexA = data.indexWhere((element) => element.id == docA);
    int indexB = data[indexA]
        .checklistElement!
        .indexWhere((element) => element.id == docB);
    itemIndex.assignAll([indexA, indexB]);
  }

  void saveItem(
      {String? docA, String? docB, int? index, required isAssessmentResult}) {
    PicaCardTableController _picaCT = Get.find(tag: 'mspp');
    searchItemIndex(docA: docA, docB: docB, index: index);
    if (isAssessmentResult) {
      _homeController
          .tempListChecklistAudit
          .value
          .checklistAudit![itemIndex[0]]
          .checklistElement![itemIndex[1]]
          .checklistData![index!]
          .assessmentResult = assessmentResult.value;
      if (assessmentResult.value == 1) {
        _homeController
            .tempListChecklistAudit
            .value
            .checklistAudit![itemIndex[0]]
            .checklistElement![itemIndex[1]]
            .checklistData![index]
            .isNo = true;
      } else {
        _homeController
            .tempListChecklistAudit
            .value
            .checklistAudit![itemIndex[0]]
            .checklistElement![itemIndex[1]]
            .checklistData![index]
            .isNo = false;
      }
      _picaCT.counter(indexA: itemIndex[0], indexB: itemIndex[1]);
    } else {
      _homeController
          .tempListChecklistAudit
          .value
          .checklistAudit![itemIndex[0]]
          .checklistElement![itemIndex[1]]
          .checklistData![index!]
          .remark = textEditingControllerALL!.text;
      textEditingControllerALL!.clear();
      _homeController.tempListChecklistAudit.refresh();
    }
  }

  void saveToDb() {
    showProgressDialog();
    connectivityChecker().then((conn) {
      if (conn) {
        _databaseProvider
            .saveChecklistData(_homeController.tempListChecklistAudit.value,
                _loginController.usr.value.username!)
            .then((value) {
          if (value) {
            showDialog(title: 'Sukses', middleText: 'Data berhasil disimpan');
          }
        });
      }
    });
  }

  void closeCurrentDialog() {
    if (Get.isDialogOpen!) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }

  showDialog({required String title, required String middleText}) {
    closeCurrentDialog();
    Get.defaultDialog(
        barrierDismissible: false,
        titleStyle: TextStyle(fontSize: 24),
        middleTextStyle: TextStyle(fontSize: 18),
        title: title,
        middleText: middleText,
        textConfirm: 'OK',
        radius: 17,
        buttonColor: Colors.yellow.shade600,
        confirmTextColor: Colors.black87,
        onConfirm: () {
          Navigator.of(Get.overlayContext!).pop();
        });
  }
}
