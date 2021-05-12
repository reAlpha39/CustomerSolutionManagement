import 'dart:io';

import 'package:customer/controller/login_controller.dart';
import 'package:customer/models/improve_process.dart';
import 'package:customer/models/model_unit.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:customer/utils/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ImproveProcessController extends GetxController {
  LoginController loginController = Get.find();
  DatabaseProvider databaseProvider = DatabaseProvider();
  PanelController? panelController;
  TextEditingController? textEditingController;
  Rx<ImproveProcess> improveProcess = ImproveProcess().obs;
  Rx<IpData> ipData = IpData().obs;
  Rx<ModelUnit?> modelUnit = ModelUnit().obs;
  RxList<String> typeUnits = RxList<String>();
  RxString matrixText = "".obs;
  RxString modelUnitText = "".obs;
  RxString typeUnit = "".obs;
  final _picker = ImagePicker();
  RxBool isPicked = false.obs;
  RxBool isLoading = false.obs;
  Rx<File> image = File("").obs;
  Rx<File>? imageBefore;
  Rx<File>? imageAfter;
  RxBool isUpdate = false.obs;
  RxBool isBefore = false.obs;
  RxInt indexUpdate = (-1).obs;
  RxBool isInit = false.obs;

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
    isInit.value = true;
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

  List<String>? loadTypeUnit() {
    List<String>? data;
    switch (modelUnitText.value) {
      case "BD":
        data = modelUnit.value!.bd;
        break;
      case "GD":
        data = modelUnit.value!.gd;
        break;
      case "HD":
        data = modelUnit.value!.hd;
        break;
      case "PC":
        data = modelUnit.value!.pc;
        break;
      case "SCN":
        data = modelUnit.value!.scn;
        break;
      case "WA":
        data = modelUnit.value!.wa;
        break;
      case "TDN":
        data = modelUnit.value!.tdn;
        break;
      case "BW":
        data = modelUnit.value!.bw;
        break;
      default:
    }
    typeUnits.value = data!;
    return data;
  }

  void loadData() {
    showProgressDialog();
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
          closeCurrentDialog();
        });
      } else {
        isLoading.value = false;
      }
    });
  }

  void saveData() {
    showProgressDialog();
    isLoading.value = true;
    String? time = "";
    String name = "";
    connectivityChecker().then((conn) {
      if (conn) {
        if (isUpdate.value) {
          time = ipData.value.id;
        } else {
          time = formatTime();
        }
        name = renameFile(isBefore: isBefore.value, name: time);
        databaseProvider
            .uploadImproveProcessImage(
                image.value, name, loginController.usr.value.username)
            .then((downloadUrl) {
          if (downloadUrl != null) {
            _fillData(
              isBefore: isBefore.value,
              isUpdate: isUpdate.value,
              downloadUrl: downloadUrl,
            );
            if (isUpdate.value) {
              _updateData();
            } else {
              _createData(time);
            }
          }
        });
      } else {
        isLoading.value = false;
      }
    });
  }

  void _updateData() {
    databaseProvider
        .updateImproveProcessData(
            ipData.value, loginController.usr.value.username, ipData.value.id)
        .then((value) {
      if (value) {
        showDialog(title: 'Sukses', middleText: 'Data berhasil diperbaharui');
        isLoading.value = false;
      }
    });
  }

  void _createData(String? time) {
    databaseProvider
        .saveImproveProcessData(
            ipData.value, loginController.usr.value.username, time)
        .then((value) {
      if (value) {
        showDialog(title: 'Sukses', middleText: 'Data berhasil ditambahkan');
        isLoading.value = false;
      }
    });
  }

  void _fillData(
      {required bool isBefore, bool? isUpdate, String? downloadUrl}) {
    if (isBefore) {
      if (isUpdate!) {
        if (downloadUrl != "") {
          ipData.value.picturePathBefore = downloadUrl;
        }
        ipData.value.descriptionBefore = textEditingController!.text;
      } else {
        ipData.value.matrix = matrixText.value;
        ipData.value.model = modelUnitText.value;
        ipData.value.type = typeUnit.value;
        ipData.value.picturePathBefore = downloadUrl;
        ipData.value.descriptionBefore = textEditingController!.text;
        ipData.value.descriptionAfter = "";
        ipData.value.picturePathAfter = "";
      }
    } else {
      if (isUpdate!) {
        if (downloadUrl != "") {
          ipData.value.picturePathAfter = downloadUrl;
        }
        ipData.value.descriptionAfter = textEditingController!.text;
      } else {
        ipData.value.picturePathAfter = downloadUrl;
        ipData.value.descriptionAfter = textEditingController!.text;
      }
    }
  }

  void deleteData(int index) {
    showProgressDialog();
    isLoading.value = true;
    connectivityChecker().then((conn) {
      if (conn) {
        databaseProvider
            .deleteImproveProcess(
                ipData: improveProcess.value.improveProcesData![index],
                username: loginController.usr.value.username)
            .then((value) {
          if (value) {
            isLoading.value = false;
            showDialog(title: 'Sukses', middleText: 'Data berhasil dihapus');
          }
        });
      } else {
        isLoading.value = false;
      }
    });
  }

  void openPanel({required bool isCreate, int? index, bool? isBeforeData}) {
    textEditingController!.clear();
    if (isCreate) {
      isUpdate.value = false;
      isBefore.value = true;
      panelController!.open();
    } else {
      isUpdate.value = true;
      if (isBeforeData!) {
        isBefore.value = true;
        textEditingController!.text =
            improveProcess.value.improveProcesData![index!].descriptionBefore!;
      } else {
        isBefore.value = false;
        textEditingController!.text =
            improveProcess.value.improveProcesData![index!].descriptionAfter!;
      }
      ipData.value = improveProcess.value.improveProcesData![index];
      ipData.refresh();
      indexUpdate.value = index;
      panelController!.open();
    }
  }

  String formatTime() {
    var currentTime = DateTime.now().toString();
    var trim = currentTime
        .replaceAll("-", "")
        .replaceAll(" ", "")
        .replaceAll(":", "")
        .split(".");
    String formatTime = trim[0];
    return formatTime;
  }

  String renameFile({required bool isBefore, String? name}) {
    String str = "";
    if (isBefore) {
      str = "before_" + name!;
    } else {
      str = "after_" + name!;
    }
    return str;
  }

  void resetPanel() {
    try {
      textEditingController!.clear();
      isPicked.value = false;
      if (image.value.existsSync()) {
        image.value.delete();
        image.refresh();
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

  void closeCurrentDialog() {
    if (Get.isDialogOpen!) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }

  showDialog({required String title, required String middleText}) {
    closeCurrentDialog();
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
          panelController!.close();
          Navigator.of(Get.overlayContext!).pop();
          loadData();
          resetPanel();
        });
  }
}
