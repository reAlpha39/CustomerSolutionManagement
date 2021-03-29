import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MsppController extends GetxController {
  static MsppController to = Get.find();

  //RadioButton
  RxList<int> radioIndexPU = [-1, -1, -1, -1, -1].obs;
  RxList<int> radioIndexMeet = [-1, -1].obs;
  RxList<int> radioIndexAsses = [-1, -1, -1, -1, -1, -1].obs;
  RxList<int> radioIndexCCD = [-1, -1, -1, -1, -1, -1, -1, -1].obs;
  RxList<int> radioIndexOPPSP = [-1, -1, -1].obs;
  RxList<int> radioIndexBSPSP = [-1, -1].obs;
  RxList<int> radioIndexRCPSP = [-1, -1, -1, -1, -1].obs;
  RxList<int> radioIndexADE = [-1, -1, -1, -1, -1, -1].obs;

  //Plan Unit
  TextEditingController textEditingControllerPU01;
  TextEditingController textEditingControllerPU02;
  TextEditingController textEditingControllerPU03;
  TextEditingController textEditingControllerPU04;
  TextEditingController textEditingControllerPU05;

  //Meet
  TextEditingController textEditingControllerM01;
  TextEditingController textEditingControllerM02;

  //Asses
  TextEditingController textEditingControllerA01;
  TextEditingController textEditingControllerA02;
  TextEditingController textEditingControllerA03;
  TextEditingController textEditingControllerA04;
  TextEditingController textEditingControllerA05;
  TextEditingController textEditingControllerA06;

  //Compile & Compute Data
  TextEditingController textEditingControllerCCD01;
  TextEditingController textEditingControllerCCD02;
  TextEditingController textEditingControllerCCD03;
  TextEditingController textEditingControllerCCD04;
  TextEditingController textEditingControllerCCD05;
  TextEditingController textEditingControllerCCD06;
  TextEditingController textEditingControllerCCD07;
  TextEditingController textEditingControllerCCD08;

  //Organize & Prioritize PS Plan
  TextEditingController textEditingControllerOPPSP01;
  TextEditingController textEditingControllerOPPSP02;
  TextEditingController textEditingControllerOPPSP03;

  //Balance & Scheduling PS Plan
  TextEditingController textEditingControllerBSPSP01;
  TextEditingController textEditingControllerBSPSP02;

  //Resource & Confirm PS Plan
  TextEditingController textEditingControllerRCPSP01;
  TextEditingController textEditingControllerRCPSP02;
  TextEditingController textEditingControllerRCPSP03;
  TextEditingController textEditingControllerRCPSP04;
  TextEditingController textEditingControllerRCPSP05;

  //Adjust Daily for Exception
  TextEditingController textEditingControllerADE01;
  TextEditingController textEditingControllerADE02;
  TextEditingController textEditingControllerADE03;
  TextEditingController textEditingControllerADE04;
  TextEditingController textEditingControllerADE05;
  TextEditingController textEditingControllerADE06;

  @override
  void onInit() {
    textEditingControllerPU01 = TextEditingController();
    textEditingControllerPU02 = TextEditingController();
    textEditingControllerPU03 = TextEditingController();
    textEditingControllerPU04 = TextEditingController();
    textEditingControllerPU05 = TextEditingController();
    textEditingControllerM01 = TextEditingController();
    textEditingControllerM02 = TextEditingController();
    textEditingControllerA01 = TextEditingController();
    textEditingControllerA02 = TextEditingController();
    textEditingControllerA03 = TextEditingController();
    textEditingControllerA04 = TextEditingController();
    textEditingControllerA05 = TextEditingController();
    textEditingControllerA06 = TextEditingController();

    textEditingControllerCCD01 = TextEditingController();
    textEditingControllerCCD02 = TextEditingController();
    textEditingControllerCCD03 = TextEditingController();
    textEditingControllerCCD04 = TextEditingController();
    textEditingControllerCCD05 = TextEditingController();
    textEditingControllerCCD06 = TextEditingController();
    textEditingControllerCCD07 = TextEditingController();
    textEditingControllerCCD08 = TextEditingController();

    textEditingControllerOPPSP01 = TextEditingController();
    textEditingControllerOPPSP02 = TextEditingController();
    textEditingControllerOPPSP03 = TextEditingController();

    textEditingControllerBSPSP01 = TextEditingController();
    textEditingControllerBSPSP02 = TextEditingController();

    textEditingControllerRCPSP01 = TextEditingController();
    textEditingControllerRCPSP02 = TextEditingController();
    textEditingControllerRCPSP03 = TextEditingController();
    textEditingControllerRCPSP04 = TextEditingController();
    textEditingControllerRCPSP05 = TextEditingController();

    textEditingControllerADE01 = TextEditingController();
    textEditingControllerADE02 = TextEditingController();
    textEditingControllerADE03 = TextEditingController();
    textEditingControllerADE04 = TextEditingController();
    textEditingControllerADE05 = TextEditingController();
    textEditingControllerADE06 = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingControllerPU01?.dispose();
    textEditingControllerPU02?.dispose();
    textEditingControllerPU03?.dispose();
    textEditingControllerPU04?.dispose();
    textEditingControllerPU05?.dispose();
    textEditingControllerM01?.dispose();
    textEditingControllerM02?.dispose();
    textEditingControllerA01?.dispose();
    textEditingControllerA02?.dispose();
    textEditingControllerA03?.dispose();
    textEditingControllerA04?.dispose();
    textEditingControllerA05?.dispose();
    textEditingControllerA06?.dispose();
    textEditingControllerCCD01?.dispose();
    textEditingControllerCCD02?.dispose();
    textEditingControllerCCD03?.dispose();
    textEditingControllerCCD04?.dispose();
    textEditingControllerCCD05?.dispose();
    textEditingControllerCCD06?.dispose();
    textEditingControllerCCD07?.dispose();
    textEditingControllerCCD08?.dispose();
    textEditingControllerOPPSP01?.dispose();
    textEditingControllerOPPSP02?.dispose();
    textEditingControllerOPPSP03?.dispose();
    textEditingControllerBSPSP01?.dispose();
    textEditingControllerBSPSP02?.dispose();
    textEditingControllerRCPSP01?.dispose();
    textEditingControllerRCPSP02?.dispose();
    textEditingControllerRCPSP03?.dispose();
    textEditingControllerRCPSP04?.dispose();
    textEditingControllerRCPSP05?.dispose();
    textEditingControllerADE01?.dispose();
    textEditingControllerADE02?.dispose();
    textEditingControllerADE03?.dispose();
    textEditingControllerADE04?.dispose();
    textEditingControllerADE05?.dispose();
    textEditingControllerADE06?.dispose();
    super.onClose();
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
