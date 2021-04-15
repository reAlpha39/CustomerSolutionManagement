import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartProgramController extends GetxController {
  RxList<int> radioIndexKP = RxList.filled(3, -1);
  RxList<int> radioIndexOP = RxList.filled(52, -1);
  RxList<int> radioIndexPE = RxList.filled(15, -1);
  RxList<int> radioIndexTS = RxList.filled(7, -1);
  RxList<int> radioIndexCI = RxList.filled(9, -1);
  RxList<int> radioIndexIF = RxList.filled(21, -1);
  RxList<int> radioIndexHE = RxList.filled(6, -1);

  RxList<String> textFieldKP = RxList.filled(3, "");
  RxList<String> textFieldOP = RxList.filled(52, "");
  RxList<String> textFieldPE = RxList.filled(15, "");
  RxList<String> textFieldTS = RxList.filled(7, "");
  RxList<String> textFieldCI = RxList.filled(9, "");
  RxList<String> textFieldIF = RxList.filled(21, "");
  RxList<String> textFieldHE = RxList.filled(6, "");

  Map<int, String> radioData = {
    0: 'Yes',
    1: 'No',
    2: 'N/A',
  };

  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;

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

  RxList<String> textFieldPP(String i) {
    RxList<String> data;
    switch (i) {
      case 'kp':
        data = textFieldKP;
        break;
      case 'op':
        data = textFieldOP;
        break;
      case 'pe':
        data = textFieldPE;
        break;
      case 'ts':
        data = textFieldTS;
        break;
      case 'ci':
        data = textFieldCI;
        break;
      case 'if':
        data = textFieldIF;
        break;
      case 'he':
        data = textFieldHE;
        break;
      default:
    }
    return data;
  }

  RxList<int> radioIndexPP(String i) {
    RxList<int> data;
    switch (i) {
      case 'kp':
        data = radioIndexKP;
        break;
      case 'op':
        data = radioIndexOP;
        break;
      case 'pe':
        data = radioIndexPE;
        break;
      case 'ts':
        data = radioIndexTS;
        break;
      case 'ci':
        data = radioIndexCI;
        break;
      case 'if':
        data = radioIndexIF;
        break;
      case 'he':
        data = radioIndexHE;
        break;
      default:
    }
    return data;
  }
}
