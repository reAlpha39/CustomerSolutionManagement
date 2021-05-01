import 'dart:io';

import 'package:customer/controller/login_controller.dart';
import 'package:customer/models/improve_process.dart';
import 'package:customer/models/model_unit.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ImproveProcessController extends GetxController {
  LoginController loginController = Get.find();
  DatabaseProvider databaseProvider = DatabaseProvider();
  PanelController panelController;
  TextEditingController textEditingController;
  Rx<ImproveProcess> improveProcess = ImproveProcess().obs;
  Rx<IpData> ipData = IpData().obs;
  Rx<ModelUnit> modelUnit = ModelUnit().obs;
  RxList<String> typeUnits = RxList<String>();
  RxString matrixText = "".obs;
  RxString modelUnitText = "".obs;
  RxString typeUnit = "".obs;
  final _picker = ImagePicker();
  RxBool isPicked = false.obs;
  RxBool isLoading = false.obs;
  RxString descriptionBefore = "".obs;
  RxString descriptionAfter = "".obs;
  Rx<File> image;
  Rx<File> imageBefore;
  Rx<File> imageAfter;

  List<String> matrixList = [
    "PI",
    "PS Plan",
    "PS",
    "OVH Plan",
    "OVH",
    "INFRAS",
    "USC",
    "TOOLS",
    "CBM",
    "PEOPLE",
    "IW",
    "VM",
    "AE",
    "MR",
    "OM",
    "OP",
    "OS",
    "RegM",
    "CO"
  ];

  @override
  void onInit() {
    panelController = PanelController();
    textEditingController = TextEditingController();
    loadModelUnit();
    loadData();
    super.onInit();
  }

  @override
  void onClose() {
    resetPanel();
    textEditingController?.dispose();
  }

  void loadModelUnit() {
    connectivityChecker().then((conn) {
      if (conn) {
        databaseProvider.loadModelUnit().then((value) {
          modelUnit.value = value;
          modelUnit.refresh();
        });
      }
    });
  }

  List<String> loadTypeUnit() {
    List<String> data;
    switch (modelUnitText.value) {
      case "BD":
        data = modelUnit.value.bd;
        break;
      case "GD":
        data = modelUnit.value.gd;
        break;
      case "HD":
        data = modelUnit.value.hd;
        break;
      case "PC":
        data = modelUnit.value.pc;
        break;
      case "SCN":
        data = modelUnit.value.scn;
        break;
      case "WA":
        data = modelUnit.value.wa;
        break;
      case "TDN":
        data = modelUnit.value.tdn;
        break;
      case "BW":
        data = modelUnit.value.bw;
        break;
      default:
    }
    typeUnits.value = data;
    return data;
  }

  void loadData() {
    isLoading.value = true;
    connectivityChecker().then((conn) {
      if (conn) {
        databaseProvider
            .loadImproveProcessData(loginController.usr.value.username)
            .then((value) {
          if (value != null) {
            improveProcess.value = ImproveProcess();
            improveProcess.value = value;
            improveProcess.refresh();
          }
          isLoading.value = false;
        });
      } else {
        isLoading.value = false;
      }
    });
  }

  void saveData({File image, bool isBefore, bool isUpdate, int indexUpdate}) {
    isLoading.value = true;
    connectivityChecker().then((conn) {
      if (conn) {
        String name = fileName(isBefore: isBefore);
        databaseProvider
            .uploadImproveProcessImage(
                image, name, loginController.usr.value.username)
            .then((downloadUrl) {
          if (downloadUrl != null) {
            if (isBefore) {
              ipData.value.matrix = matrixText.value;
              ipData.value.model = modelUnitText.value;
              ipData.value.type = typeUnit.value;
              ipData.value.picturePathBefore = downloadUrl;
              ipData.value.descriptionBefore = textEditingController.text;
            } else {
              ipData.value.picturePathAfter = downloadUrl;
              ipData.value.descriptionAfter = textEditingController.text;
            }
            if (isUpdate) {
              improveProcess.value.improveProcesData[indexUpdate] =
                  ipData.value;
            } else if (improveProcess.value.improveProcesData == null) {
              improveProcess.value.improveProcesData = [ipData.value];
            } else {
              improveProcess.value.improveProcesData.add(ipData.value);
            }
            improveProcess.refresh();
            databaseProvider
                .saveImproveProcessData(
                    improveProcess.value, loginController.usr.value.username)
                .then((value) {
              if (value) {
                showDialog(
                    title: 'Sukses', middleText: 'Data berhasil ditambahkan');
                isLoading.value = false;
              }
            });
          }
        });
      } else {
        isLoading.value = false;
      }
    });
  }

  String fileName({bool isBefore}) {
    String name = "";
    var currentTime = DateTime.now().toString();
    var trim = currentTime
        .replaceAll("-", "")
        .replaceAll(" ", "")
        .replaceAll(":", "")
        .split(".");
    String formatTime = trim[0];
    if (isBefore) {
      name = "before_" + formatTime;
    } else {
      name = "after_" + formatTime;
    }
    return name;
  }

  void resetPanel() {
    try {
      textEditingController.clear();
      isPicked.value = false;
      if (image != null) {
        image.value.delete();
      }
    } catch (e) {
      print(e);
    }
  }

  Future imageFromCamera() async {
    isPicked.value = false;
    var file = await _picker.getImage(source: ImageSource.camera);
    if (file != null) {
      image = Rx<File>(File(file.path));
      image.refresh();
      isPicked.value = true;
    } else {
      print('No image selected');
    }
  }

  Future imageFromGallery() async {
    isPicked.value = false;
    var file =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    if (file != null) {
      image = Rx<File>(File(file.path));
      image.refresh();
      isPicked.value = true;
    } else {
      print('No image selected');
    }
  }

  showDialog({String title, String middleText}) {
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
          panelController.close();
          resetPanel();
          loadData();
          print(improveProcess.value.toMap());
          Get.back(closeOverlays: false);
        });
  }
}
