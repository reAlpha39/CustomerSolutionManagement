import 'package:customer/models/other_program.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repositories/database_provider.dart';

class OtherProgramController extends GetxController {
  final DatabaseProvider _databaseProvider = DatabaseProvider();

  Map<int, String> radioData = {
    0: 'Yes',
    1: 'No',
    2: 'N/A',
  };

  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;

  TextEditingController? textEditingControllerALL;

  @override
  void onInit() {
    // loadOtherP\rogram(username: _loginController.usr.value.username);
    textEditingControllerALL = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingControllerALL?.dispose();
    super.onClose();
  }

  void showProgressDialog() {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
  }
}
