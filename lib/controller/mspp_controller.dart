import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MsppController extends GetxController {
  static MsppController to = Get.find();

  //RadioButton
  RxList<int> listRadioIndexPU = [-1, -1, -1, -1, -1].obs;

  TextEditingController textEditingControllerPU01;
  TextEditingController textEditingControllerPU02;
  TextEditingController textEditingControllerPU03;
  TextEditingController textEditingControllerPU04;
  TextEditingController textEditingControllerPU05;

  @override
  void onInit() {
    textEditingControllerPU01 = TextEditingController();
    textEditingControllerPU02 = TextEditingController();
    textEditingControllerPU03 = TextEditingController();
    textEditingControllerPU04 = TextEditingController();
    textEditingControllerPU05 = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingControllerPU01?.dispose();
    textEditingControllerPU02?.dispose();
    textEditingControllerPU03?.dispose();
    textEditingControllerPU04?.dispose();
    textEditingControllerPU05?.dispose();
    super.onClose();
  }
}
