import 'dart:io';

import 'package:customer/models/model_unit.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ImproveProcessController extends GetxController {
  DatabaseProvider databaseProvider = DatabaseProvider();
  PanelController panelController;
  TextEditingController textEditingController;
  Rx<ModelUnit> modelUnit = ModelUnit().obs;
  RxList<String> typeUnits = RxList<String>();
  RxString matrixText = "".obs;
  RxString modelUnitText = "".obs;
  RxString typeUnit = "".obs;
  RxString description;
  final _picker = ImagePicker();
  RxBool isPicked = false.obs;
  Rx<File> image;

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

  void saveData() {}

  void resetPanel() {
    textEditingController.clear();
    isPicked.value = false;
    if (image != null) {
      image.value.delete();
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
}
