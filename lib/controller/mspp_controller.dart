import 'package:customer/models/mspp.dart';
import 'package:customer/models/mspp_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppController extends GetxController {
  static MsppController to = Get.find();

  //RadioButton
  RxList<int> radioIndexPU = [-1, -1, -1, -1, -1].obs;
  RxList<int> radioIndexMeet = [-1, -1].obs;
  RxList<int> radioIndexAsses = [-1, -1, -1, -1, -1, -1].obs;
  RxList<int> radioIndexCCD =
      [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1].obs;
  RxList<int> radioIndexOPPSP = [-1, -1, -1].obs;
  RxList<int> radioIndexBSPSP = [-1, -1].obs;
  RxList<int> radioIndexRCPSP = [-1, -1, -1, -1, -1].obs;
  RxList<int> radioIndexADE = [-1, -1, -1, -1, -1, -1].obs;
  RxList<int> radioIndexPPS = [-1, -1, -1].obs;
  RxList<int> radioIndexAPPT = [-1, -1, -1, -1, -1].obs;
  RxList<int> radioIndexEPSS = [-1, -1, -1, -1, -1, -1, -1].obs;
  RxList<int> radioIndexTPSNP = [-1, -1, -1, -1].obs;
  RxList<int> radioIndexHPTD = [-1, -1, -1, -1, -1].obs;
  RxList<int> radioIndexEDS = [-1, -1, -1].obs;
  RxList<int> radioIndexRPLL = [-1, -1].obs;

  // Rx<MsppData> msppDataPU = MsppData(
  //   assessmentResult: [-1, -1, -1, -1, -1],
  //   remark: ["", "", "", "", ""]
  // ).obs;

  // Rx<MsppData> msppDataMeet = MsppData(
  //   assessmentResult: [-1, -1],
  //   remark: ["", ""]
  // ).obs;

  // Rx<MsppData> msppDataAsses = MsppData(
  //   assessmentResult: [-1, -1, -1, -1, -1],
  //   remark: ["", "", "", "", ""]
  // ).obs;

  //Textfield data
  RxList<String> textFieldPU = ["", "", "", "", ""].obs;
  RxList<String> textFieldMeet = ["", ""].obs;
  RxList<String> textFieldAsses = ["", "", "", "", "", ""].obs;
  RxList<String> textFieldCCD =
      ["", "", "", "", "", "", "", "", "", "", "", "", "", ""].obs;
  RxList<String> textFieldOPPSP = ["", "", ""].obs;
  RxList<String> textFieldBSPSP = ["", ""].obs;
  RxList<String> textFieldRCPSP = ["", "", "", "", ""].obs;
  RxList<String> textFieldADE = ["", "", "", "", "", ""].obs;
  RxList<String> textFieldPPS = ["", "", ""].obs;
  RxList<String> textFieldAPPT = ["", "", "", "", ""].obs;
  RxList<String> textFieldEPSS = ["", "", "", "", "", "", ""].obs;
  RxList<String> textFieldTPSNP = ["", "", "", ""].obs;
  RxList<String> textFieldHPTD = ["", "", "", "", ""].obs;
  RxList<String> textFieldEDS = ["", "", ""].obs;
  RxList<String> textFieldRPLL = ["", ""].obs;

  Map<int, String> radioData = {
    0: 'Yes',
    1: 'No',
    2: 'N/A',
  };

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

  RxList<String> textFieldPI(String i) {
    RxList<String> data;
    switch (i) {
      case 'planUnit':
        data = textFieldPU;
        break;
      case 'meet':
        data = textFieldMeet;
        break;
      case 'asses':
        data = textFieldAsses;
        break;
      case 'ccd':
        data = textFieldCCD;
        break;
      case 'oppsp':
        data = textFieldOPPSP;
        break;
      case 'bspsp':
        data = textFieldBSPSP;
        break;
      case 'rcpsp':
        data = textFieldRCPSP;
        break;
      case 'ade':
        data = textFieldADE;
        break;
      case 'pps':
        data = textFieldPPS;
        break;
      case 'appt':
        data = textFieldAPPT;
        break;
      case 'epss':
        data = textFieldEPSS;
        break;
      case 'tpsnp':
        data = textFieldTPSNP;
        break;
      case 'hptd':
        data = textFieldHPTD;
        break;
      case 'eds':
        data = textFieldEDS;
        break;
      case 'rpll':
        data = textFieldRPLL;
        break;
      default:
    }
    return data;
  }

  RxList<int> radioIndexPI(String i) {
    RxList<int> data;
    switch (i) {
      case 'planUnit':
        data = radioIndexPU;
        break;
      case 'meet':
        data = radioIndexMeet;
        break;
      case 'asses':
        data = radioIndexAsses;
        break;
      case 'ccd':
        data = radioIndexCCD;
        break;
      case 'oppsp':
        data = radioIndexOPPSP;
        break;
      case 'bspsp':
        data = radioIndexBSPSP;
        break;
      case 'rcpsp':
        data = radioIndexRCPSP;
        break;
      case 'ade':
        data = radioIndexADE;
        break;
        case 'pps':
        data = radioIndexPPS;
        break;
      case 'appt':
        data = radioIndexAPPT;
        break;
      case 'epss':
        data = radioIndexEPSS;
        break;
      case 'tpsnp':
        data = radioIndexTPSNP;
        break;
      case 'hptd':
        data = radioIndexHPTD;
        break;
      case 'eds':
        data = radioIndexEDS;
        break;
      case 'rpll':
        data = radioIndexRPLL;
        break;
      default:
    }
    return data;
  }
}
