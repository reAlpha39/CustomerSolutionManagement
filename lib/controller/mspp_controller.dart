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
      default:
    }
    return data;
  }
}
