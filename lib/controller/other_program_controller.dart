import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherProgramController extends GetxController {

  RxList<int> radioIndexOS = [-1, -1, -1].obs;

  RxList<String> textFieldOS = ["", "", ""].obs;

  Map<int, String> radioData = {
    0: 'Yes',
    1: 'No',
    2: 'N/A',
  };

  RxBool isLoading = false.obs;

  TextEditingController textEditingControllerALL;

  RxList<String> textFieldPI(String i) {
    RxList<String> data;
    switch (i) {
      case 'os':
        data = textFieldOS;
        break;
      default:
    }
    return data;
  }

  RxList<int> radioIndexPI(String i) {
    RxList<int> data;
    switch (i) {
      case 'planUnit':
        data = radioIndexOS;
        break;
      default:
    }
    return data;
  }
}
