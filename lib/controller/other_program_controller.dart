import 'package:customer/models/other_program.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/mspp_data.dart';
import '../repositories/database_provider.dart';
import '../utils/connectivity_checker.dart';
import 'login_controller.dart';

class OtherProgramController extends GetxController {
  final LoginController _loginController = Get.find();
  final DatabaseProvider _databaseProvider = DatabaseProvider();

  RxList<int> radioIndexOS = RxList.filled(3, -1);
  RxList<int> radioIndexPO = RxList.filled(14, -1);
  RxList<int> radioIndexLO = RxList.filled(14, -1);
  RxList<int> radioIndexPRO = RxList.filled(14, -1);
  RxList<int> radioIndexDO = RxList.filled(25, -1);
  RxList<int> radioIndexAO = RxList.filled(14, -1);
  RxList<int> radioIndexSHEO = RxList.filled(14, -1);
  RxList<int> radioIndexPV = RxList.filled(3, -1);
  RxList<int> radioIndexMTDT = RxList.filled(4, -1);
  RxList<int> radioIndexEV = RxList.filled(4, -1);
  RxList<int> radioIndexRM = RxList.filled(9, -1);

  RxList<String> textFieldOS = RxList.filled(3, "");
  RxList<String> textFieldPO = RxList.filled(14, "");
  RxList<String> textFieldLO = RxList.filled(14, "");
  RxList<String> textFieldPRO = RxList.filled(14, "");
  RxList<String> textFieldDO = RxList.filled(25, "");
  RxList<String> textFieldAO = RxList.filled(14, "");
  RxList<String> textFieldSHEO = RxList.filled(14, "");
  RxList<String> textFieldPV = RxList.filled(3, "");
  RxList<String> textFieldMTDT = RxList.filled(4, "");
  RxList<String> textFieldEV = RxList.filled(4, "");
  RxList<String> textFieldRM = RxList.filled(9, "");

  Map<int, String> radioData = {
    0: 'Yes',
    1: 'No',
    2: 'N/A',
  };

  RxBool isLoading = false.obs;

  TextEditingController textEditingControllerALL;

  @override
  void onInit() {
    loadOtherProgram(username: _loginController.usr.value.username);
    textEditingControllerALL = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingControllerALL?.dispose();
    super.onClose();
  }

  loadOtherProgram({String username}) {
    isLoading.value = true;
    connectivityChecker().then((conn) {
      if (conn) {
        _databaseProvider.loadOtherProgramData(username).then((value) {
          if (value.people != null) {
            radioIndexOS.assignAll(value.people['os'].assessmentResult);
            radioIndexPO.assignAll(value.people['po'].assessmentResult);
            radioIndexLO.assignAll(value.people['lo'].assessmentResult);
            radioIndexPRO.assignAll(value.people['pro'].assessmentResult);
            radioIndexDO.assignAll(value.people['do'].assessmentResult);
            radioIndexAO.assignAll(value.people['ao'].assessmentResult);
            radioIndexSHEO.assignAll(value.people['sheo'].assessmentResult);
            radioIndexPV.assignAll(value.vm['pv'].assessmentResult);
            radioIndexMTDT.assignAll(value.vm['mtdt'].assessmentResult);
            radioIndexEV.assignAll(value.vm['ev'].assessmentResult);
            radioIndexRM.assignAll(value.regM['rm'].assessmentResult);
            textFieldOS.assignAll(value.people['os'].remark);
            textFieldPO.assignAll(value.people['po'].remark);
            textFieldLO.assignAll(value.people['lo'].remark);
            textFieldPRO.assignAll(value.people['pro'].remark);
            textFieldDO.assignAll(value.people['do'].remark);
            textFieldAO.assignAll(value.people['ao'].remark);
            textFieldSHEO.assignAll(value.people['sheo'].remark);
            textFieldPV.assignAll(value.vm['pv'].remark);
            textFieldMTDT.assignAll(value.vm['mtdt'].remark);
            textFieldEV.assignAll(value.vm['ev'].remark);
            textFieldRM.assignAll(value.regM['rm'].remark);
          }
          isLoading.value = false;
        });
      }
    });
  }

  saveData() {
    saveDataOtherProgram(username: _loginController.usr.value.username);
  }

  saveDataOtherProgram({String username}) {
    Get.back(closeOverlays: false);
    showProgressDialog();
    connectivityChecker().then((conn) {
      if (conn) {
        MsppData otherDataOS =
            MsppData(assessmentResult: radioIndexOS, remark: textFieldOS);
        MsppData otherDataPO =
            MsppData(assessmentResult: radioIndexPO, remark: textFieldPO);
        MsppData otherDataLO =
            MsppData(assessmentResult: radioIndexLO, remark: textFieldLO);
        MsppData otherDataPRO =
            MsppData(assessmentResult: radioIndexPRO, remark: textFieldPRO);
        MsppData otherDataDO =
            MsppData(assessmentResult: radioIndexDO, remark: textFieldDO);
        MsppData otherDataAO =
            MsppData(assessmentResult: radioIndexAO, remark: textFieldAO);
        MsppData otherDataSHEO =
            MsppData(assessmentResult: radioIndexSHEO, remark: textFieldSHEO);
        MsppData otherDataPV =
            MsppData(assessmentResult: radioIndexPV, remark: textFieldPV);
        MsppData otherDataMTDT =
            MsppData(assessmentResult: radioIndexMTDT, remark: textFieldMTDT);
        MsppData otherDataEV =
            MsppData(assessmentResult: radioIndexEV, remark: textFieldEV);
        MsppData otherDataRM =
            MsppData(assessmentResult: radioIndexRM, remark: textFieldRM);

        OtherProgram otherProgram = OtherProgram(people: {
          'os': otherDataOS,
          'po': otherDataPO,
          'lo': otherDataLO,
          'pro': otherDataPRO,
          'do': otherDataDO,
          'ao': otherDataAO,
          'sheo': otherDataSHEO
        }, vm: {
          'pv': otherDataPV,
          'mtdt': otherDataMTDT,
          'ev': otherDataEV
        }, regM: {
          'rm': otherDataRM
        });
        _databaseProvider.saveOtherProgram(otherProgram, username);
      }
    });
    Get.back(closeOverlays: false);
  }

  void showProgressDialog() {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
  }

  RxList<String> textFieldOP(String i) {
    RxList<String> data;
    switch (i) {
      case 'os':
        data = textFieldOS;
        break;
      case 'po':
        data = textFieldPO;
        break;
      case 'lo':
        data = textFieldLO;
        break;
      case 'pro':
        data = textFieldPRO;
        break;
      case 'do':
        data = textFieldDO;
        break;
      case 'ao':
        data = textFieldAO;
        break;
      case 'sheo':
        data = textFieldSHEO;
        break;
      case 'pv':
        data = textFieldPV;
        break;
      case 'mtdt':
        data = textFieldMTDT;
        break;
      case 'ev':
        data = textFieldEV;
        break;
      case 'rm':
        data = textFieldRM;
        break;
      default:
    }
    return data;
  }

  RxList<int> radioIndexOP(String i) {
    RxList<int> data;
    switch (i) {
      case 'os':
        data = radioIndexOS;
        break;
      case 'po':
        data = radioIndexPO;
        break;
      case 'lo':
        data = radioIndexLO;
        break;
      case 'pro':
        data = radioIndexPRO;
        break;
      case 'do':
        data = radioIndexDO;
        break;
      case 'ao':
        data = radioIndexAO;
        break;
      case 'sheo':
        data = radioIndexSHEO;
        break;
      case 'pv':
        data = radioIndexPV;
        break;
      case 'mtdt':
        data = radioIndexMTDT;
        break;
      case 'ev':
        data = radioIndexEV;
        break;
      case 'rm':
        data = radioIndexRM;
        break;
      default:
    }
    return data;
  }
}
