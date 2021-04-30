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
  RxString description;
  final _picker = ImagePicker();
  RxBool isPicked = false.obs;
  Rx<File> image;

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
