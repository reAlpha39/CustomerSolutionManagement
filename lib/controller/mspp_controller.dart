import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MsppController extends GetxController {
  static MsppController to = Get.find();

  //RadioButton
  RxList<int> listRadioIndexPI =
      [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1].obs;

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
    super.onClose();
  }
}
